require 'json'

class InstagramParser
  def self.parse(api_response_body)
    map_user_data(nodes(json(api_response_body)))
  end

  :private
  def self.json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def self.nodes(json)
    json[:data][:user][:edge_follow][:edges]
  end

  def self.map_user_data(nodes)
    nodes.map do |user_info|
      {ig_user_id: user_info[:node][:id],
       ig_username: user_info[:node][:username],
       is_verified: user_info[:node][:is_verified],
       is_private: user_info[:node][:is_private],
       follows_back: user_info[:node][:followed_by_viewer] }
    end
  end
end
