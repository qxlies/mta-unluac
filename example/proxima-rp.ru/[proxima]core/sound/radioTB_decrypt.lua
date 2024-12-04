RadioTb = {
  {
    "Country",
    "http://uk3.internet-radio.com:8076/live",
    0.8
  },
  {
    "Jazz",
    "https://prod-54-81-231-255.amperwave.net/ppm-jazz24aac48-ibc1?session-id=940186a5a0d2277a53e579861127d0d9",
    0.9
  },
  {
    "State.fm",
    "https://myradio24.org/statefm",
    0.8
  },
  {
    "Onyx",
    "http://178.32.139.86:9432/listen.pls?sid=1",
    1
  },
  {
    "Dirty South Radio",
    "http://192.211.51.158:8010/listen.pls?sid=1",
    1.1
  },
  {
    "Radio Los Santos",
    "https://streams.rpr1.de/rpr-hiphop-128-mp3",
    1.2
  },
  {
    "Rock Radio",
    "https://myradio24.org/proximafm",
    1.5
  },
  {
    "Vladivostok FM",
    "https://myradio24.org/vladifm.m3u",
    0.8
  },
  {
    "Russian Radio",
    "https://rr-rodnye00.hostingradio.ru/rodnye0096.aacp",
    1.2
  },
  {
    "Club Radio",
    "http://us2.internet-radio.com:8075",
    0.8
  },
  {
    "Rasta",
    "https://streams.fluxfm.de/rastaradio/mp3-128/radiode/",
    1.2
  },
  {
    "Raggaeton",
    "http://latinareggaeton.ice.infomaniak.ch/latinareggaeton.mp3",
    1
  },
  {
    "La Mega",
    "http://s1.voscast.com:9638/",
    5
  },
  {
    "Mi Barril",
    "http://204.12.193.98:8397/listen.pls?sid=1",
    1.5
  },
  {
    "New Retro Wave",
    "http://85.234.59.191:8000/stream",
    0.8
  },
  {
    "Alex Jones",
    "https://streams.infowars.com/alexjonesshow-aac",
    1
  },
  {
    "Men's Radio",
    "https://stream.zenolive.com/f174214qvzzuv.aac",
    1.2
  },
  {
    "K-JAH West",
    "http://s1.voscast.com:9638/",
    1.2
  },
  {
    "LSFM",
    "https://listen6.myradio24.com/lsfm",
    1.2
  },
  {
    "Chicano Rap Radio",
    "https://listen4.myradio24.com/42886",
    1.2
  }
}
RadioTb[0] = {
  "Рок",
  "https://myradio24.org/vladifm.m3u",
  1.3
}
RadioTb[-1] = {
  "Митол",
  "http://79.111.119.111:9177/",
  1.1
}
RadioTb[-2] = {
  "Instrumental",
  "http://174.142.215.249:8625/listen.pls?sid=1",
  1.3
}
RadioTb[-3] = {
  "Ранчела",
  "http://163.172.198.16:8417/stream",
  1.3
}
RadioTb[-4] = {
  "Сектор газа",
  "http://209.133.216.3:7478/listen.pls?sid=1",
  1.3
}
RadioTb[-5] = {
  "ГовнарьФМ",
  "https://pub0301.101.ru:8443/stream/trust/mp3/128/42",
  1.1
}
function getRadioNames()
  nameTb = {}
  for _FORV_3_ = 1, #RadioTb do
    nameTb[_FORV_3_] = RadioTb[_FORV_3_][1]
  end
  return _FOR_
end
sirenModes = {
  [1] = {
    {
      "siren/3_1.wav",
      16
    },
    {
      "siren/3_2.wav",
      10
    },
    {
      "siren/3_3.wav",
      3
    }
  },
  [2] = {
    {
      "siren/1_1.wav",
      10
    },
    {
      "siren/1_2.wav",
      10
    },
    {
      "siren/1_3.wav",
      10
    }
  },
  [3] = {
    {
      "siren/det1_1.wav",
      12
    },
    {
      "siren/det1_2.wav",
      6
    }
  },
  [4] = {
    {
      "siren/2_1.wav",
      16
    },
    {
      "siren/2_2.wav",
      10
    }
  },
  [5] = {
    {
      "siren/amb1_1.wav",
      12
    },
    {
      "siren/amb1_2.wav",
      6
    }
  },
  [6] = {
    {
      "siren/fire1_1.wav",
      12
    },
    {
      "siren/fire1_2.wav",
      6
    }
  }
}
