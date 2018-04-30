
  class Helloworld < Hyperloop::Component

    state show_field: false
    state field_value: ""

    def render
      DIV(class: 'hyperloophelloword')do
        IMG(src: 'https://rawgit.com/ruby-hyperloop/hyperloop-js-helloworld/master/hyperloop-logo-medium-white.png?raw=true')
        H3 { "The complete isomorphic ruby framework" }
        BR{}
        
          show_button
        DIV(class: 'formdiv') do
          show_input
          show_text
        end if state.show_field
      end
    end
    
    def show_button
    BUTTON(class: 'btn btn-info') do
      state.show_field ? "Click to hide HelloWorld input field" : "Click to show HelloWorld input field"
    end.on(:click) { mutate.show_field !state.show_field }
  end

  def show_input

    H4 do 
      SPAN{'Please type '}
      SPAN(class: 'colored') {'Hello World'}
      SPAN{' in the input field below :'}
      BR {}
      SPAN{'Or anything you want (^̮^)'}
    end

    INPUT(type: :text, class: 'form-control').on(:change) do |e|
      mutate.field_value e.target.value
    end

  end

  def show_text
    H1 { "input field value will be displayed here" unless state.field_value }
  end
end

