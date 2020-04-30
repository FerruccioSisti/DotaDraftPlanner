module ApplicationHelper

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

        puts(org_list)
        puts(org_list.count)
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
        puts(team_games)
        puts(team_games.count)
        return team_games
    end

end
