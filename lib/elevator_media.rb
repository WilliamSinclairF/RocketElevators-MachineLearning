module ElevatorMedia
  class Streamer
    def getContent(html_element, content)
      "<#{html_element}>#{content}</#{html_element}>"
    end
  end
end
