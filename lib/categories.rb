module DiscourseApi
  module API
    module Categories
      # :color and :text_color are RGB hexadecimal strings
      def create_category(args)
        args = API.params(args)
                   .required(:name, :color, :text_color)
                   .optional(:description, :parent_category_id)
        response = post("/categories", args)
        response['category']
      end
    end
  end
end