module ApplicationHelper

    def page_entries_info(collection, options = {})
      entry_name = options[:entry_name] || (collection.empty?? 'item' :
          collection.first.class.name.split('::').last.titleize)
      if collection.total_pages < 2
        case collection.size
        when 0; "No #{entry_name.pluralize} found"
        else; "Displaying all #{entry_name.pluralize}"
        end
      else
        %{Displaying %d - %d of %d #{entry_name.pluralize}} % [
          collection.offset + 1,
          collection.offset + collection.length,
          collection.total_entries
        ]
      end
    end

    def validatedb(scouter)
        if scouter.team.present?
            scouter.write_attribute(:teamname, name_scraper(scouter.team))
        end
        if scouter.player1.present?
            scouter.write_attribute(:player1name, name_scraper(scouter.player1))
        end
        if scouter.player2.present?
            scouter.write_attribute(:player2name, name_scraper(scouter.player2))
        end
        if scouter.player3.present?
            scouter.write_attribute(:player3name, name_scraper(scouter.player3))
        end
        if scouter.player4.present?
            scouter.write_attribute(:player4name, name_scraper(scouter.player4))
        end
        if scouter.player5.present?
            scouter.write_attribute(:player5name, name_scraper(scouter.player5))
        end
        
        scouter.save
    end

    def recent_games_scraper(player_url)
        url = player_url + "/matches"

        # validate
        if !player_url.include?("dotabuff.com/players/") || HTTParty.get(url).response.body.empty? || HTTParty.get(url).response.body.nil?
            return "Error retrieving URL"
        end

        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        personal_games = Array.new
        recent_games = parsed_page.css('article').css('tbody')[1].css('tr')

        recent_games.each do |game_listing|
            game = {
                hero: game_listing.children[1].children[0].children.text,
                result: game_listing.children[3].children[0].attributes["class"].value
            }
            personal_games << game
        end

        # organize list of recent games by hero and find winrate + total games played
        org_list = Array.new
        temp_arr = Array.new

        personal_games.each do |game_listing|
            hero_name = game_listing[:hero].to_s
            # reset values every time we try to find stats for another hero
            win_count = 0
            loss_count = 0

            # if we already counted for this hero then skip
            if temp_arr.include? hero_name
                next
            end

            # compare to everything in our list because i don't know how else to sort this info
            personal_games.each do |g_listing|
                if hero_name.eql?(g_listing[:hero].to_s)
                    # if same hero name check for win or loss and update that array
                    if g_listing[:result].to_s.eql?("won")
                        win_count += 1
                    else
                        loss_count += 1
                    end
                end
            end

            total = win_count + loss_count
            stats = {
                hero: hero_name,
                total_games: total,
                percentage: (win_count.to_f / (total).to_f).round(2)
            }

            temp_arr << hero_name
            org_list << stats
        end

        # sort the list with most played heroes at the beginning
        org_list = org_list.sort_by { |player| player[:total_games] }.reverse!

        return org_list
    end

    def esports_team_scraper(team_url)
        url = team_url + "/heroes"

        # validate
        if !team_url.include?("dotabuff.com/esports/teams/") || HTTParty.get(url).response.body.empty? || HTTParty.get(url).response.body.nil?
            return "Error retrieving URL"
        end

        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        team_games = Array.new
        most_played_heroes = parsed_page.css('tbody')[0].css('tr')

        # only do a max of 10 heroes we don't want more than that information because its not useful
        i = 0
        most_played_heroes.each do |game_listing|
            if i >= 10
                break
            end
            game = {
                hero: game_listing.children[1].children[1].children[0].text,
                times_picked: game_listing.children[2].children[0].text,
                win_percentage: game_listing.children[3].children[0].text
            }
            team_games << game
            i += 1
        end
        return team_games
    end

    def name_scraper(base_url)
        if !base_url.include?("dotabuff.com/")
            return "Error, input was not correct"
        end
        unparsed_page = HTTParty.get(base_url)

        if unparsed_page.response.body.nil? || unparsed_page.response.body.empty? then
            return "Error retrieving URL"
        end

        parsed_page = Nokogiri::HTML(unparsed_page)
        name = parsed_page.css('div.header-content-title').children[0].children[0].text
        return name
    end

end
