class AnimalsController < ApplicationController
  def index
    # <!--Yas : START code searchbar in animals controller -->
    @animals = policy_scope(Animal).order(created_at: :desc)

    if params[:query].present?
      @animals = Animal.search_by_address_species_name(params[:query])
      if params[:start_date].present? && params[:end_date].present?
        @animals = @animals.select { |animal| animal.is_available?(params[:start_date], params[:end_date]) }
        p @animals
      end
    elsif params[:start_date].present? && params[:end_date].present?
      @animals = @animals.select { |animal| animal.is_available?(params[:start_date], params[:end_date]) }
      p @animals
    end

    # <!--Yas : END code searchbar in animals controller -->
    if params[:species].present?
      @animals = policy_scope(Animal).where(species: params[:species]).order(created_at: :desc)
    end

     @markers = @animals.map do |animal|
    {
      lat: animal.latitude,
      lng: animal.longitude,
      id: animal.id,
      info_window: render_to_string(partial: "info_window", locals: { animal: animal }),
      image_url: helpers.asset_url("paws.png")
    }
    end
  end

  def show
    @animal = Animal.find(params[:id])
    authorize @animal
    @user = current_user
    # create the reservation
    @reservation = Reservation.new
  end

  def new
    @species = [
      "Aardvark", "Albatross","Alligator","Alpaca","Ant","Anteater","Antelope","Ape","Armadillo","Donkey","Baboon","Badger","Barracuda","Bat","Bear","Beaver","Bee","Bird","Bison","Boar","Buffalo","Butterfly","Camel","Capybara","Caribou","Cassowary","Cat","Caterpillar","Cattle","Chamois","Cheetah","Chicken","Chimpanzee","Chinchilla","Chough","Clam","Cobra","Cockroach","Cod","Cormorant","Coyote","Crab","Crane","Crocodile","Crow","Curlew","Deer","Dinosaur","Dog","Dogfish","Dolphin","Dotterel","Dove","Dragonfly","Duck","Dugong","Dunlin","Eagle","Echidna","Eel","Eland","Elephant","Elk","Emu","Falcon","Ferret","Finch","Fish","Flamingo","Fly","Fox","Frog","Gaur","Gazelle","Gerbil","Giraffe","Gnat","Gnu","Goat","Goldfinch","Goldfish","Goose","Gorilla","Goshawk","Grasshopper","Grouse","Guanaco","Gull","Hamster","Hare","Hawk","Hedgehog","Heron","Herring","Hippopotamus","Hornet","Horse","Human","Hummingbird","Hyena","Ibex","Ibis","Jackal","Jaguar","Jay","Jellyfish","Kangaroo","Kingfisher","Koala","Kookabura","Kouprey","Kudu","Lapwing","Lark","Lemur","Leopard","Lion","Llama","Lobster","Locust","Loris","Louse","Lyrebird","Magpie","Mallard","Manatee","Mandrill","Mantis","Marten","Meerkat","Mink","Mole","Mongoose","Monkey","Moose","Mosquito","Mouse","Mule","Narwhal","Newt","Nightingale","Octopus","Okapi","Opossum","Oryx","Ostrich","Otter","Owl","Oyster","Panther","Parrot","Partridge","Peafowl","Pelican","Penguin","Pheasant","Pig","Pigeon","Pony","Porcupine","Porpoise","Quail","Quelea","Quetzal","Rabbit","Raccoon","Rail","Ram","Rat","Raven","Red deer","Red panda","Reindeer","Rhinoceros","Rook","Salamander","Salmon","Sand Dollar","Sandpiper","Sardine","Scorpion","Seahorse","Seal","Shark","Sheep","Shrew","Skunk","Snail","Snake","Sparrow","Spider","Spoonbill","Squid","Squirrel","Starling","Stingray","Stinkbug","Stork","Swallow","Swan","Tapir","Tarsier","Termite","Tiger","Toad","Trout","Turkey","Turtle","Viper","Vulture","Wallaby","Walrus","Wasp","Weasel","Whale","Wildcat","Wolf","Wolverine","Wombat","Woodcock","Woodpecker","Worm","Wren","Yak","Zebra"
    ]
    @animal = Animal.new
    @animal = Animal.new
    authorize @animal
    @user = current_user
  end

  def create
    @animal = Animal.new(animal_params)
    authorize @animal
    @animal.user = current_user
    if @animal.save!
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    authorize @animal
  end

  def update
    @animal = Animal.find(params[:id])
    authorize @animal
    @animal.update(animal_params)
    redirect_to animal_path
  end

  def destroy
    @animal = Animal.find(params[:id])
    authorize @animal
    @animal.destroy
    if params[:from] == "dashboard"
      redirect_to dashboard_path
    else
      redirect_to animals_path
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :address, :price, :description, :species, :quality, photos: [])
  end
end
