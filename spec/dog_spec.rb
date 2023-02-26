describe Dog do
  let(:db) { DB[:conn] }

  before do
    db.execute("DROP TABLE IF EXISTS dogs")
    Dog.create_table
  end

  after do
    db.execute("DROP TABLE IF EXISTS dogs")
  end

  describe ".create_table" do
    it 'creates the dogs table in the database' do
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='dogs';"
      expect(db.execute(table_check_sql)[0]).to eq(['dogs'])
    end
  end

  describe ".drop_table" do
    it 'drops the dogs table from the database' do
      Dog.drop_table
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='dogs';"
      expect(db.execute(table_check_sql)[0]).to eq(nil)
    end
  end

  describe "#save" do
    it 'saves an instance of the dog class to the database and then sets the id attribute on the instance'

  # BONUS! uncomment the tests below for an extra challenge
  # describe '.find_or_create_by' do
  #   it 'creates an instance of a dog if it does not already exist' do
  #     dog1 = Dog.create(name: 'teddy', breed: 'cockapoo')
  #     dog2 = Dog.find_or_create_by(name: 'teddy', breed: 'cockapoo')

  #     expect(dog2.id).to eq(dog1.id)
  #   end

  #   it 'when two dogs have the same name and different breed, it returns the correct dog' do
  #     dog1 = Dog.create(name: 'teddy', breed: 'cockapoo')
  #     Dog.create(name: 'teddy', breed: 'pug')

  #     dog_from_db = Dog.find_or_create_by(name: 'teddy', breed: 'cockapoo')

  #     expect(dog_from_db.id).to eq(1)
  #     expect(dog_from_db.id).to eq(dog1.id)
  #   end

  #   it 'when creating a new dog with the same name as persisted dogs, it returns the correct dog' do
  #     Dog.create(name: 'teddy', breed: 'cockapoo')
  #     Dog.create(name: 'teddy', breed: 'pug')

  #     new_dog = Dog.find_or_create_by(name: 'teddy', breed: 'irish setter')

  #     expect(new_dog.id).to eq(3)
  #   end
  # end

  # describe '#update' do
  #   it 'updates the record associated with a given instance' do
  #     teddy = Dog.create(name: "Teddy", breed: "cockapoo")
  #     teddy.name = "Teddy Jr."
  #     teddy.update
  #     also_teddy = Dog.find_by_name("Teddy Jr.")
  #     expect(also_teddy.id).to eq(teddy.id)
  #   end
  # end

  # context 'when called on a record with an ID' do
  #   describe '#save' do
  #     it 'updates the record associated with a given instance' do
  #       teddy = Dog.create(name: 'teddy', breed: 'cockapoo')
  #       teddy.name = "Teddy Jr."
  #       teddy.save
  #       also_teddy = Dog.find_by_name("Teddy Jr.")
  #       expect(also_teddy.id).to eq(teddy.id)
  #     end
  #   end
  # end

end
