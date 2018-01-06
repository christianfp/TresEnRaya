
Given ("Visito la pagina de inicio") do
    visit '/'
  end

Given("Visito la pagina del juego") do
    visit '/Juego'
end

Then("deberia mostrar el boton {string}") do |string|
    last_response.body.should =~ /#{string}/m
  end
When("presiono el boton {string}") do |string|
    click_button(string)
  end
Then("deberia mostrar el mensaje {string}") do |string|
    last_response.body.should =~ /#{string}/m
end

  