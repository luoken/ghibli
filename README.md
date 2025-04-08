# Ghibli
An Elixir wrapper for the [Ghibli Rest API] (https://ghibliapi.vercel.app/#).


## Install
```
def deps do
  [
    {:ghibli, "~> 0.1.0"}
  ]
end
```

## Usage
### Films
```
iex(1)> Ghibli.Film.all
[
  %Ghibli.Film{
    id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
    description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates" <> _,
    title: "Castle in the Sky",
    image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
    url: "https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe",
    original_title: "天空の城ラピュタ",
    original_title_romanised: "Tenkū no shiro Rapyuta",
    movie_banner: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
    director: "Hayao Miyazaki",
    producer: "Isao Takahata",
    release_date: "1986",
    running_time: "124",
    rt_score: "95",
    people: ["https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9", ...],
    species: ["https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"],
    locations: ["https://ghibliapi.vercel.app/locations/"],
    vehicles: ["https://ghibliapi.vercel.app/vehicles/4e09b023-f650-4747-9ab9-eacf14540cfb"]
  },
  %Ghibli.Film{
    id: "12cfb892-aac0-4c5b-94af-521852e46d6a",
    description: "In the latter part of World War II, a boy and his sister, orphaned when their mother is killed in the firebombing of Tokyo, are left to survive on their own in what remains of civilian life in Japan." <> _,
    image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg",
    url: "https://ghibliapi.vercel.app/films/12cfb892-aac0-4c5b-94af-521852e46d6a",
    original_title: "火垂るの墓",
    original_title_romanised: "Hotaru no haka",
    movie_banner: "https://image.tmdb.org/t/p/original/vkZSd0Lp8iCVBGpFH9L7LzLusjS.jpg",
    director: "Isao Takahata",
    producer: "Toru Hara",
    release_date: "1988",
    running_time: "89",
    rt_score: "97",
    people: ["https://ghibliapi.vercel.app/people/"],
    species: ["https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"],
    locations: ["https://ghibliapi.vercel.app/locations/"],
    vehicles: ["https://ghibliapi.vercel.app/vehicles/"]
  }, ...
]
```

```
iex> Ghibli.Film.get_by("790e0028-a31c-4626-a694-86b7a8cada40")
%Ghibli.Film{
  id: "790e0028-a31c-4626-a694-86b7a8cada40",
  description: "An orphan girl, Earwig, is adopted by a witch and comes home to a spooky house filled with mystery and magic.",
  title: "Earwig and the Witch",
  image: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sJhFtY3eHuvvACaPpxpzdCLQqpQ.jpg",
  url: "https://ghibliapi.vercel.app/films/790e0028-a31c-4626-a694-86b7a8cada40",
  original_title: "アーヤと魔女",
  original_title_romanised: "Āya to Majo",
  movie_banner: "https://www.themoviedb.org/t/p/original/qMxpGzmmnY1jLd4p7EhhoW43wWF.jpg",
  director: "Gorō Miyazaki",
  producer: "Toshio Suzuki",
  release_date: "2021",
  running_time: "82",
  rt_score: "30",
  people: ["https://ghibliapi.vercel.app/people/"],
  species: ["https://ghibliapi.vercel.app/species/"],
  locations: ["https://ghibliapi.vercel.app/locations/"],
  vehicles: ["https://ghibliapi.vercel.app/vehicles/"]
}
```

### Locations
```
iex(4)> Ghibli.Location.all
[
  %Ghibli.Location{
    id: "11014596-71b0-4b3e-b8c0-1c4b15f28b9a",
    name: "Irontown",
    climate: "Continental",
    terrain: "Mountain",
    surface_water: "40",
    residents: ["https://ghibliapi.vercel.app/people/ba924631-068e-4436-b6de-f3283fa848f0",
     "https://ghibliapi.vercel.app/people/030555b3-4c92-4fce-93fb-e70c3ae3df8b"],
    films: ["https://ghibliapi.vercel.app/films/0440483e-ca0e-4120-8c50-4c8cd9b965d6"],
    url: "https://ghibliapi.vercel.app/locations/11014596-71b0-4b3e-b8c0-1c4b15f28b9a"
  },
  %Ghibli.Location{
    id: "64a996aa-481e-4627-9624-ab23f59a05a9",
    name: "Gutiokipanja",
    climate: "Continental",
    terrain: "Hill",
    surface_water: "50",
    residents: ["https://ghibliapi.vercel.app/people/ba924631-068e-4436-b6de-f3283fa848f0",
     "https://ghibliapi.vercel.app/people/030555b3-4c92-4fce-93fb-e70c3ae3df8b"],
    films: ["https://ghibliapi.vercel.app/films/0440483e-ca0e-4120-8c50-4c8cd9b965d6"],
    url: "https://ghibliapi.vercel.app/locations/64a996aa-481e-4627-9624-ab23f59a05a9"
  }, ...
]
```

```
iex> Ghibli.Location.get_by("a8bd9c03-7c80-4a97-b7c0-6a668acaf576")
%Ghibli.Location{
  id: "a8bd9c03-7c80-4a97-b7c0-6a668acaf576",
  name: "The Cat Kingdom",
  climate: "Continental",
  terrain: "Plain",
  surface_water: "30",
  residents: ["https://ghibliapi.vercel.app/people/6b3facea-ea33-47b1-96ce-3fc737b119b8",
   "https://ghibliapi.vercel.app/people/3042818d-a8bb-4cba-8180-c19249822d57",
   "https://ghibliapi.vercel.app/people/58d1973f-f247-47d7-9358-e56cb0d2b5a6",
   "https://ghibliapi.vercel.app/people/a3d8e70f-46a0-4e5a-b850-db01620d6b92",
   "https://ghibliapi.vercel.app/people/fc196c4f-0201-4ed2-9add-c6403f7c4d32"],
  films: ["https://ghibliapi.vercel.app/films/90b72513-afd4-4570-84de-a56c312fdf81"],
  url: "https://ghibliapi.vercel.app/locations/a8bd9c03-7c80-4a97-b7c0-6a668acaf576"
}
```

### Species
```
iex> Ghibli.Species.all
[
  %Ghibli.Species{
    id: "af3910a6-429f-4c74-9ad5-dfe1c4aa04f2",
    classification: "Mammal",
    eye_colors: "Black, Blue, Brown, Grey, Green, Hazel",
    hair_colors: "Black, Blonde, Brown, Grey, White",
    people: ["https://ghibliapi.vercel.app/people/ba924631-068e-4436-b6de-f3283fa848f0",
     "https://ghibliapi.vercel.app/people/e9356bb5-4d4a-4c93-aadc-c83e514bffe3",
     "https://ghibliapi.vercel.app/people/34277bec-7401-43fa-a00a-5aee64b45b08",
     "https://ghibliapi.vercel.app/people/91939012-90b9-46e5-a649-96b898073c82",...],
    films: ["https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe",
     "https://ghibliapi.vercel.app/films/12cfb892-aac0-4c5b-94af-521852e46d6a",
     "https://ghibliapi.vercel.app/films/58611129-2dbc-4a81-a72f-77ddfc1b1b49", ...],
    url: "https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"
  },
  %Ghibli.Species{
    id: "6bc92fdd-b0f4-4286-ad71-1f99fb4a0d1e",
    classification: "Elk",
    eye_colors: "Black, Red",
    hair_colors: "Brown, Light Orange",
    people: ["https://ghibliapi.vercel.app/people/030555b3-4c92-4fce-93fb-e70c3ae3df8b",
     "https://ghibliapi.vercel.app/people/ca568e87-4ce2-4afa-a6c5-51f4ae80a60b"],
    films: ["https://ghibliapi.vercel.app/films/0440483e-ca0e-4120-8c50-4c8cd9b965d6"],
    url: "https://ghibliapi.vercel.app/species/6bc92fdd-b0f4-4286-ad71-1f99fb4a0d1e"
  }, ...
]
```

```
iex> Ghibli.Species.get_by("6bc92fdd-b0f4-4286-ad71-1f99fb4a0d1e")
%Ghibli.Species{
  id: "6bc92fdd-b0f4-4286-ad71-1f99fb4a0d1e",
  classification: "Elk",
  eye_colors: "Black, Red",
  hair_colors: "Brown, Light Orange",
  people: ["https://ghibliapi.vercel.app/people/030555b3-4c92-4fce-93fb-e70c3ae3df8b",
   "https://ghibliapi.vercel.app/people/ca568e87-4ce2-4afa-a6c5-51f4ae80a60b"],
  films: ["https://ghibliapi.vercel.app/films/0440483e-ca0e-4120-8c50-4c8cd9b965d6"],
  url: "https://ghibliapi.vercel.app/species/6bc92fdd-b0f4-4286-ad71-1f99fb4a0d1e"
}
```

### People
```
iex> Ghibli.People.all
[
  %Ghibli.People{
    id: "267649ac-fb1b-11eb-9a03-0242ac130003",
    name: "Haku",
    gender: "Male",
    age: "12",
    eye_color: "Green",
    hair_color: "Green",
    films: ["https://ghibliapi.vercel.app/films/dc2e6bd1-8156-4886-adff-b39e6043af0c"],
    species: "https://ghibliapi.vercel.app/species/e2cfaa78-fb19-11eb-9a03-0242ac130003",
    url: "https://ghibliapi.vercel.app/people/267649ac-fb1b-11eb-9a03-0242ac130003"
  },
  %Ghibli.People{
    id: "fe93adf2-2f3a-4ec4-9f68-5422f1b87c01",
    name: "Pazu",
    gender: "Male",
    age: "13",
    eye_color: "Black",
    hair_color: "Brown",
    films: ["https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"],
    species: "https://ghibliapi.vercel.app/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2",
    url: "https://ghibliapi.vercel.app/people/fe93adf2-2f3a-4ec4-9f68-5422f1b87c01"
  }, ...
]
```

```
iex> Ghibli.People.get_by("267649ac-fb1b-11eb-9a03-0242ac130003")
%Ghibli.People{
  id: "267649ac-fb1b-11eb-9a03-0242ac130003",
  name: "Haku",
  gender: "Male",
  age: "12",
  eye_color: "Green",
  hair_color: "Green",
  films: ["https://ghibliapi.vercel.app/films/dc2e6bd1-8156-4886-adff-b39e6043af0c"],
  species: "https://ghibliapi.vercel.app/species/e2cfaa78-fb19-11eb-9a03-0242ac130003",
  url: "https://ghibliapi.vercel.app/people/267649ac-fb1b-11eb-9a03-0242ac130003"
}
```

### Vehicles
```
iex> Ghibli.Vehicles.all
[
  %Ghibli.Vehicles{
    id: "4e09b023-f650-4747-9ab9-eacf14540cfb",
    name: "Air Destroyer Goliath",
    description: "A military airship utilized by the government to access Laputa",
    vehicle_class: "Airship",
    length: "1,000",
    pilot: "https://ghibliapi.vercel.app/people/40c005ce-3725-4f15-8409-3e1b1b14b583",
    films: ["https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"],
    url: "https://ghibliapi.vercel.app/vehicles/4e09b023-f650-4747-9ab9-eacf14540cfb"
  },
  %Ghibli.Vehicles{
    id: "d8f893b5-1dd9-41a1-9918-0099c1aa2de8",
    name: "Red Wing",
    description: "An experimental aircraft captured by Porco. Named Savoia S.21",
    vehicle_class: "Airplane",
    length: "20",
    pilot: "https://ghibliapi.vercel.app/people/6523068d-f5a9-4150-bf5b-76abe6fb42c3",
    films: ["https://ghibliapi.vercel.app/films/ebbb6b7c-945c-41ee-a792-de0e43191bd8"],
    url: "https://ghibliapi.vercel.app/vehicles/d8f893b5-1dd9-41a1-9918-0099c1aa2de8"
  },
  %Ghibli.Vehicles{
    id: "923d70c9-8f15-4972-ad53-0128b261d628",
    name: "Sosuke's Boat",
    description: "A toy boat where Sosuke plays",
    vehicle_class: "Boat",
    length: "10",
    pilot: "https://ghibliapi.vercel.app/people/a10f64f3-e0b6-4a94-bf30-87ad8bc51607",
    films: ["https://ghibliapi.vercel.app/films/758bf02e-3122-46e0-884e-67cf83df1786"],
    url: "https://ghibliapi.vercel.app/vehicles/923d70c9-8f15-4972-ad53-0128b261d628"
  }
]
```

```
iex> Ghibli.Vehicles.get_by("923d70c9-8f15-4972-ad53-0128b261d628")
%Ghibli.Vehicles{
  id: "923d70c9-8f15-4972-ad53-0128b261d628",
  name: "Sosuke's Boat",
  description: "A toy boat where Sosuke plays",
  vehicle_class: "Boat",
  length: "10",
  pilot: "https://ghibliapi.vercel.app/people/a10f64f3-e0b6-4a94-bf30-87ad8bc51607",
  films: ["https://ghibliapi.vercel.app/films/758bf02e-3122-46e0-884e-67cf83df1786"],
  url: "https://ghibliapi.vercel.app/vehicles/923d70c9-8f15-4972-ad53-0128b261d628"
}
```
