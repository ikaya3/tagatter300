atom_feed do |feed|
  feed.title "Tagatter"
  limited_messages = Message.order("created_at DESC").limit(20)
  latest_message = limited_messages.first
  feed.updated (latest_message && latest_message.created_at)

  limited_messages.each do |message|
    feed.entry(message) do |entry|
      entry.title message.body.slice(0,20)
      entry.content message.body, :type => 'html'
      entry.author do |author|
        author.name (message.user && message.user.username)
      end
    end
  end
end
