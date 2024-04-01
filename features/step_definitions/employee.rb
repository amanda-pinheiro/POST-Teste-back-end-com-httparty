Dado('que o usuario cadastre um novo funcionario') do
    @post_url = 'https://reqres.in/api/users?page=7/create'
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
      "id": 7,
      "email": "suzanna.stone@reqres.in",
      "first_name": "Suzanna",
      "last_name": "Stone",
      "avatar": "https://reqres.in/img/faces/7-image.jpg"
    }.to_json)
    puts @create_employee
  end
  
  Entao('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql (201)
    expect(@create_employee.msg).to eql 'Created'
    expect(@create_employee["first_name"]).to eql 'Suzanna'
    expect(@create_employee["email"]). to eql 'suzanna.stone@reqres.in'
    expect(@create_employee["id"]).to eql (7)
  end