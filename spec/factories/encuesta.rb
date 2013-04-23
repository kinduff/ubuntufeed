# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :encuestum, :class => 'Encuesta' do
    ip "MyString"
    puntuacion 1
    comentario "MyText"
  end
end
