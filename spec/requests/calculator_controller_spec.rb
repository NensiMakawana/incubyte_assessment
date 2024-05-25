require 'swagger_helper'

describe 'Calculator Controller' do

  path '/add' do

    post 'String Calculator' do
      tags 'Calculator'
      parameter name: :numbers, in: :query, type: :string

      response '200', 'Return sum' do
        run_test!
      end
    end
  end
end