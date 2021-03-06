require "picasa/presenter/base"

module Picasa
  module Presenter
    class Comment < Base
      # @return [Presenter::Author]
      def author
        @author ||= Author.new(parsed_body["author"][0])
      end

      # @return [Array<Presenter::Link>]
      def links
        @links ||= array_wrap(safe_retrieve(parsed_body, "link")).map { |link| Link.new(link) }
      end

      # @return [DateTime]
      def published
        @published ||= map_to_date(safe_retrieve(parsed_body, "published"))
      end

      # @return [DateTime]
      def updated
        @updated ||= map_to_date(safe_retrieve(parsed_body, "updated"))
      end

      # @return [DateTime]
      def edited
        @edited ||= map_to_date(safe_retrieve(parsed_body, "edited"))
      end

      # @return [String]
      def title
        @title ||= safe_retrieve(parsed_body, "title")
      end

      # @return [String]
      def etag
        @etag ||= safe_retrieve(parsed_body, "gd$etag")
      end

      # @return [String]
      def content
        @content ||= safe_retrieve(parsed_body, "content", "$t")
      end

      # @return [String]
      def id
        @id ||= safe_retrieve(parsed_body, "gphoto$id")
      end

      # @return [String]
      def photo_id
        @photo_id ||= safe_retrieve(parsed_body, "gphoto$photoid")
      end
    end
  end
end
