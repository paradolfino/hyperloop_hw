
  class Helloworld < Hyperloop::Component

    state show_field: false

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
      "Toggle button"
    end
  end

  def show_input

    H4 do 
      SPAN{'Please type '}
      SPAN(class: 'colored') {'Hello World'}
      SPAN{' in the input field below :'}
      BR {}
      SPAN{'Or anything you want (^̮^)'}
    end

    INPUT(type: :text, class: 'form-control')

  end

  def show_text
    H1 { "input field value will be displayed here" }
  end
end

