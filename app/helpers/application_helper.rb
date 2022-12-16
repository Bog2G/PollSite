module ApplicationHelper
  def link_to_add_question(question, form, association, **args)
    new_question = form.object.send(association).klass.new
    id = new_question.object_id
    fields = form.fields_for(association, new_question, child_index: id) do |builder|
      render(association.to_s.singularize, form: builder)
    end
    link_to(question, '#', class: "add_fields" + args[:class], data: {id: id, fields: fields.gsub("\n","")})
  end
end

