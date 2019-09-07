# This method is used to make it easier to render the same fields styles
# throughout your app
#
# ## Usage
#
#     render_field(form.email) { |i| email_input i }
#     render_field(form.email) { |i| email_input i, autofocus: "true" }
#
# ## Customization
#
# You can customize this method so that fields render like you expect
# For example, you might wrap it in a div with a "field-wrapper" class.
#
#    div class: "field-wrapper"
#      label_for field
#      yield field
#      mount Shared::FieldErrors.new(fields)
#    end
#
# You may also want to have more than one method if you render fields
# differently in different parts of your app, e.g. `compact_field`
class Shared::Field(T) < BaseComponent
  needs field : Avram::PermittedAttribute(T)

  def render
    div class: "form-row" do
      label_for @field

      with_defaults field: @field do |input_builder|
        yield input_builder
      end

      mount Shared::FieldErrors.new(@field)
    end
  end

  def render
    render &.text_input
  end
end
