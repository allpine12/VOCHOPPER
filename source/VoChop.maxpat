{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 6,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60.0,
   60.0,
   1400.0,
   900.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "default_fontsize": 10.0,
  "default_fontface": 0,
  "default_fontname": "Arial Bold",
  "gridonopen": 1,
  "gridsize": [
   8.0,
   8.0
  ],
  "gridsnaponopen": 1,
  "objectsnaponopen": 1,
  "statusbarvisible": 2,
  "toolbarvisible": 1,
  "lefttoolbarpinned": 0,
  "toptoolbarpinned": 0,
  "righttoolbarpinned": 0,
  "bottomtoolbarpinned": 0,
  "toolbars_unpinned_last_save": 0,
  "tallnewobj": 0,
  "boxanimatetime": 200,
  "enablehscroll": 1,
  "enablevscroll": 1,
  "devicewidth": 1068.0,
  "description": "",
  "digest": "",
  "tags": "",
  "style": "",
  "subpatcher_template": "",
  "assistshowspatchername": 0,
  "boxes": [
   {
    "box": {
     "maxclass": "newobj",
     "text": "live.thisdevice",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "int",
      "int"
     ],
     "patching_rect": [
      20,
      20,
      119,
      22.0
     ],
     "id": "obj-1"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b b b",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      20,
      50,
      63,
      22.0
     ],
     "id": "obj-2"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "init",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      80,
      42,
      22.0
     ],
     "id": "obj-3"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "start",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      80,
      49,
      22.0
     ],
     "id": "obj-4"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "js vochop.js ---vc",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      20,
      400,
      180,
      22.0
     ],
     "id": "obj-5"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "notein",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "int",
      "int"
     ],
     "patching_rect": [
      300,
      20,
      56,
      22.0
     ],
     "id": "obj-6"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      50,
      70,
      22.0
     ],
     "id": "obj-7"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend note",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      80,
      98,
      22.0
     ],
     "id": "obj-8"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "bendin",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ],
     "patching_rect": [
      420,
      20,
      56,
      22.0
     ],
     "id": "obj-9"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend bend",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      50,
      98,
      22.0
     ],
     "id": "obj-10"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "r vochop_bus_inst",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      540,
      20,
      133,
      22.0
     ],
     "id": "obj-11"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend busin",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      540,
      50,
      105,
      22.0
     ],
     "id": "obj-12"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "r ---uiclick",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      700,
      20,
      98,
      22.0
     ],
     "id": "obj-13"
    }
   },
   {
    "box": {
     "maxclass": "jsui",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      470,
      520,
      165
     ],
     "presentation": 1,
     "presentation_rect": [
      170,
      2,
      520,
      165
     ],
     "filename": "vochop_ui.js",
     "jsarguments": [
      "main"
     ],
     "border": 0,
     "parameter_enable": 0,
     "id": "obj-14"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---bigui",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      560,
      470,
      84,
      22.0
     ],
     "id": "obj-15"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "js vochop_push.js",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      470,
      130,
      22.0
     ],
     "id": "obj-16"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "node.script vochop_asr.js @autostart 1 @watch 0",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      860,
      470,
      290,
      22.0
     ],
     "id": "obj-17"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route buf bus fx setrec setbase pattr node",
     "numinlets": 1,
     "numoutlets": 8,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      20,
      700,
      300,
      22.0
     ],
     "id": "obj-18"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---vc 60000 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      20,
      760,
      150,
      22.0
     ],
     "id": "obj-19"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      20,
      790,
      40,
      22.0
     ],
     "id": "obj-20"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "loaded",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      820,
      56,
      22.0
     ],
     "id": "obj-21"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s vochop_bus_in",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      180,
      760,
      119,
      22.0
     ],
     "id": "obj-22"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pattr vcstate @parameter_enable 1",
     "numinlets": 2,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      520,
      760,
      210,
      22.0
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "vcstate",
       "parameter_shortname": "vcstate",
       "parameter_type": 3,
       "parameter_invisible": 1,
       "parameter_initial_enable": 0
      }
     },
     "varname": "vcstate",
     "id": "obj-23"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend state",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      520,
      790,
      105,
      22.0
     ],
     "id": "obj-24"
    }
   },
   {
    "box": {
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      20,
      900,
      120,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      2,
      110,
      22
     ],
     "text": "VOCHOP",
     "fontsize": 15.0,
     "fontface": 1,
     "id": "obj-25"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      20,
      940,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      27,
      74,
      26
     ],
     "mode": 1,
     "text": "REC",
     "texton": "REC",
     "varname": "Rec",
     "activebgoncolor": [
      1.0,
      0.24,
      0.2,
      1.0
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Rec",
       "parameter_shortname": "Rec",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-26"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend rec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      970,
      91,
      22.0
     ],
     "id": "obj-27"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      120,
      970,
      91,
      22.0
     ],
     "id": "obj-28"
    }
   },
   {
    "box": {
     "maxclass": "live.drop",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      220,
      940,
      76,
      26
     ],
     "presentation": 1,
     "presentation_rect": [
      88,
      27,
      76,
      26
     ],
     "parameter_enable": 0,
     "id": "obj-29"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dropfile",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      220,
      970,
      126,
      22.0
     ],
     "id": "obj-30"
    }
   },
   {
    "box": {
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "patching_rect": [
      320,
      940,
      100,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      58,
      156,
      16
     ],
     "parameter_enable": 1,
     "varname": "Mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Mode",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 3.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "Words + Parts",
        "Syllables",
        "Word List",
        "Keys"
       ]
      }
     },
     "id": "obj-31"
    }
   },
   {
    "box": {
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "patching_rect": [
      440,
      940,
      100,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      78,
      156,
      16
     ],
     "parameter_enable": 1,
     "varname": "Trigger",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Trigger",
       "parameter_shortname": "Trigger",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "One-Shot",
        "Gate",
        "Loop"
       ]
      }
     },
     "id": "obj-32"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      20,
      1010,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      98,
      44,
      16
     ],
     "mode": 0,
     "text": "LEARN",
     "texton": "LEARN",
     "varname": "Learn",
     "parameter_enable": 0,
     "id": "obj-33"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend learn",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      1040,
      105,
      22.0
     ],
     "id": "obj-34"
    }
   },
   {
    "box": {
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      100,
      1010,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      56,
      98,
      50,
      16
     ],
     "parameter_enable": 1,
     "varname": "Base",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Base",
       "parameter_shortname": "Base",
       "parameter_type": 1,
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_initial": [
        36
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 8,
       "parameter_invisible": 0
      }
     },
     "id": "obj-35"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend set",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      100,
      1040,
      91,
      22.0
     ],
     "id": "obj-36"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      180,
      1010,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      110,
      98,
      26,
      16
     ],
     "mode": 0,
     "text": "<",
     "texton": "<",
     "varname": "TakePrev",
     "parameter_enable": 0,
     "id": "obj-37"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      230,
      1010,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      138,
      98,
      26,
      16
     ],
     "mode": 0,
     "text": ">",
     "texton": ">",
     "varname": "TakeNext",
     "parameter_enable": 0,
     "id": "obj-38"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend takeprev",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      1040,
      126,
      22.0
     ],
     "id": "obj-39"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend takenext",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      300,
      1040,
      126,
      22.0
     ],
     "id": "obj-40"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      20,
      1080,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      118,
      76,
      16
     ],
     "mode": 0,
     "text": "BIG VIEW",
     "texton": "BIG VIEW",
     "varname": "BigView",
     "parameter_enable": 0,
     "id": "obj-41"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      100,
      1080,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      88,
      118,
      76,
      16
     ],
     "mode": 0,
     "text": "MAKE CLIP",
     "texton": "MAKE CLIP",
     "varname": "MakeClip",
     "parameter_enable": 0,
     "id": "obj-42"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend makeclip",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      100,
      1110,
      126,
      22.0
     ],
     "id": "obj-43"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      20,
      1150,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      138,
      76,
      16
     ],
     "mode": 1,
     "text": "AI WORDS",
     "texton": "AI WORDS",
     "varname": "AI Words",
     "activebgoncolor": [
      1.0,
      0.42,
      0.24,
      1.0
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "AI Words",
       "parameter_shortname": "AI Words",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-44"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      100,
      1150,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      88,
      138,
      76,
      16
     ],
     "mode": 1,
     "text": "PUSH PADS",
     "texton": "PUSH PADS",
     "varname": "Push Pads",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Push Pads",
       "parameter_shortname": "Push Pads",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-45"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend enable",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      100,
      1180,
      112,
      22.0
     ],
     "id": "obj-46"
    }
   },
   {
    "box": {
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      200,
      1150,
      120,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      112,
      3,
      26,
      18
     ],
     "text": "Link",
     "fontsize": 8.5,
     "fontface": 0,
     "id": "obj-47"
    }
   },
   {
    "box": {
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      200,
      1180,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      136,
      4,
      28,
      15
     ],
     "parameter_enable": 1,
     "varname": "Link",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Link",
       "parameter_shortname": "Link",
       "parameter_type": 1,
       "parameter_mmin": 1.0,
       "parameter_mmax": 4.0,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_invisible": 0
      }
     },
     "id": "obj-48"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "p bigview",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      20,
      1140,
      80,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       120.0,
       120.0,
       560.0,
       600.0
      ],
      "bglocked": 0,
      "openinpresentation": 1,
      "default_fontsize": 10.0,
      "default_fontface": 0,
      "default_fontname": "Arial Bold",
      "gridonopen": 1,
      "gridsize": [
       8.0,
       8.0
      ],
      "gridsnaponopen": 1,
      "objectsnaponopen": 1,
      "statusbarvisible": 0,
      "toolbarvisible": 0,
      "lefttoolbarpinned": 0,
      "toptoolbarpinned": 0,
      "righttoolbarpinned": 0,
      "bottomtoolbarpinned": 0,
      "toolbars_unpinned_last_save": 0,
      "tallnewobj": 0,
      "boxanimatetime": 200,
      "enablehscroll": 1,
      "enablevscroll": 1,
      "devicewidth": 0.0,
      "description": "",
      "digest": "",
      "tags": "",
      "style": "",
      "subpatcher_template": "",
      "assistshowspatchername": 0,
      "boxes": [
       {
        "box": {
         "maxclass": "newobj",
         "text": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          10,
          49,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "r ---bigui",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          80,
          10,
          84,
          22.0
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "jsui",
         "numinlets": 1,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          0,
          40,
          560,
          600
         ],
         "presentation": 1,
         "presentation_rect": [
          0,
          0,
          560,
          600
         ],
         "filename": "vochop_ui.js",
         "jsarguments": [
          "big"
         ],
         "border": 0,
         "parameter_enable": 0,
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "s ---uiclick",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          660,
          98,
          22.0
         ],
         "id": "obj-4"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "obj-2",
          0
         ],
         "destination": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          0
         ],
         "destination": [
          "obj-4",
          0
         ]
        }
       }
      ],
      "title": "VoChop - Big View"
     },
     "saved_object_attributes": {
      "description": "",
      "digest": "",
      "globalpatchername": "",
      "tags": "",
      "style": ""
     },
     "id": "obj-49"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      20,
      1110,
      40,
      22.0
     ],
     "id": "obj-50"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "open",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      60,
      1110,
      42,
      22.0
     ],
     "id": "obj-51"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pcontrol",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      60,
      1140,
      70,
      22.0
     ],
     "id": "obj-52"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      800,
      20,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      698,
      2,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Pitch",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Pitch",
       "parameter_shortname": "Pitch",
       "parameter_type": 1,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 7,
       "parameter_invisible": 0
      }
     },
     "id": "obj-53"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      860,
      20,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      744,
      2,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Attack",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Attack",
       "parameter_shortname": "Attack",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 500.0,
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-54"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      920,
      20,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      790,
      2,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Release",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Release",
       "parameter_shortname": "Release",
       "parameter_type": 0,
       "parameter_mmin": 5.0,
       "parameter_mmax": 4000.0,
       "parameter_initial": [
        120
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-55"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      980,
      20,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      836,
      2,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Spread",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Spread",
       "parameter_shortname": "Spread",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        30
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-56"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      1040,
      20,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      882,
      2,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Poly",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Poly",
       "parameter_shortname": "Poly",
       "parameter_type": 1,
       "parameter_mmin": 1.0,
       "parameter_mmax": 8.0,
       "parameter_initial": [
        8
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_invisible": 0
      }
     },
     "id": "obj-57"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      1100,
      20,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      928,
      2,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Velocity",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Velocity",
       "parameter_shortname": "Vel",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        70
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-58"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      1160,
      20,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      974,
      2,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Stutter",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Stutter",
       "parameter_shortname": "Stutter",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 6.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "Off",
        "1/4",
        "1/8",
        "1/16",
        "1/32",
        "1/8T",
        "1/16T"
       ]
      }
     },
     "id": "obj-59"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      800,
      90,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      698,
      57,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Cutoff",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Cutoff",
       "parameter_shortname": "Cutoff",
       "parameter_type": 0,
       "parameter_mmin": 20.0,
       "parameter_mmax": 20000.0,
       "parameter_initial": [
        20000
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 3,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-60"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      860,
      90,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      744,
      57,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Reso",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Reso",
       "parameter_shortname": "Reso",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        10
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-61"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      920,
      90,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      790,
      57,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Crush",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Crush",
       "parameter_shortname": "Crush",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-62"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      980,
      90,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      836,
      57,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Drive",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Drive",
       "parameter_shortname": "Drive",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-63"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      1040,
      90,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      882,
      57,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Delay",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Delay",
       "parameter_shortname": "Delay",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-64"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      1100,
      90,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      928,
      57,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Time",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Time",
       "parameter_shortname": "Time",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 6.0,
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1/16",
        "1/8T",
        "1/8",
        "1/8D",
        "1/4",
        "1/4D",
        "1/2"
       ]
      }
     },
     "id": "obj-65"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      1160,
      90,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      974,
      57,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Feedback",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Feedback",
       "parameter_shortname": "Fdbk",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 95.0,
       "parameter_initial": [
        40
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-66"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      800,
      160,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      698,
      112,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Reverb",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Reverb",
       "parameter_shortname": "Reverb",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-67"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      860,
      160,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      744,
      112,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Size",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Size",
       "parameter_shortname": "Size",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        60
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-68"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      920,
      160,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      790,
      112,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Words",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Words",
       "parameter_shortname": "Words",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        50
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-69"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      980,
      160,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      836,
      112,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Syllables",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Syllables",
       "parameter_shortname": "Syll",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        50
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0
      }
     },
     "id": "obj-70"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "patching_rect": [
      1040,
      160,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      882,
      112,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Filter",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Filter",
       "parameter_shortname": "Filter",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 3.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "Off",
        "LP",
        "HP",
        "BP"
       ]
      }
     },
     "id": "obj-71"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      800,
      240,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      928,
      116,
      44,
      16
     ],
     "mode": 1,
     "text": "REVERSE",
     "texton": "REVERSE",
     "varname": "Reverse",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Reverse",
       "parameter_shortname": "Reverse",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-72"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      860,
      240,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      974,
      116,
      44,
      16
     ],
     "mode": 1,
     "text": "SNAP",
     "texton": "SNAP",
     "varname": "Snap",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Snap",
       "parameter_shortname": "Snap",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-73"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      800,
      270,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      928,
      135,
      44,
      16
     ],
     "mode": 1,
     "text": "TUNE",
     "texton": "TUNE",
     "varname": "Tune",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tune",
       "parameter_shortname": "Tune",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-74"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      860,
      270,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      974,
      135,
      44,
      16
     ],
     "mode": 1,
     "text": "CHOKE",
     "texton": "CHOKE",
     "varname": "Choke",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Choke",
       "parameter_shortname": "Choke",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     },
     "id": "obj-75"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p mode",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      320,
      961,
      110,
      22
     ],
     "id": "obj-76"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p trig",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      440,
      961,
      110,
      22
     ],
     "id": "obj-77"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p base",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      100,
      1031,
      110,
      22
     ],
     "id": "obj-78"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p ai",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      1171,
      110,
      22
     ],
     "id": "obj-79"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p link",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      1201,
      110,
      22
     ],
     "id": "obj-80"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p pitch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      800,
      74,
      110,
      22
     ],
     "id": "obj-81"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p attack",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      860,
      74,
      110,
      22
     ],
     "id": "obj-82"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p release",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920,
      74,
      110,
      22
     ],
     "id": "obj-83"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p spread",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      980,
      74,
      110,
      22
     ],
     "id": "obj-84"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p poly",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040,
      74,
      110,
      22
     ],
     "id": "obj-85"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p vel",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1100,
      74,
      110,
      22
     ],
     "id": "obj-86"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p stutter",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1160,
      74,
      110,
      22
     ],
     "id": "obj-87"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p cutoff",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      800,
      144,
      110,
      22
     ],
     "id": "obj-88"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p reso",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      860,
      144,
      110,
      22
     ],
     "id": "obj-89"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p crush",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920,
      144,
      110,
      22
     ],
     "id": "obj-90"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p drive",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      980,
      144,
      110,
      22
     ],
     "id": "obj-91"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p delay",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040,
      144,
      110,
      22
     ],
     "id": "obj-92"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p dtime",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1100,
      144,
      110,
      22
     ],
     "id": "obj-93"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p fdbk",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1160,
      144,
      110,
      22
     ],
     "id": "obj-94"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p reverb",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      800,
      214,
      110,
      22
     ],
     "id": "obj-95"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p size",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      860,
      214,
      110,
      22
     ],
     "id": "obj-96"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p wsens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      920,
      214,
      110,
      22
     ],
     "id": "obj-97"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p ssens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      980,
      214,
      110,
      22
     ],
     "id": "obj-98"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p ftype",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1040,
      214,
      110,
      22
     ],
     "id": "obj-99"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p reverse",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      800,
      261,
      110,
      22
     ],
     "id": "obj-100"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p snap",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      860,
      261,
      110,
      22
     ],
     "id": "obj-101"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p tune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      800,
      291,
      110,
      22
     ],
     "id": "obj-102"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p choke",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      860,
      291,
      110,
      22
     ],
     "id": "obj-103"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route 0 1 2 3 4 5 6 7",
     "numinlets": 1,
     "numoutlets": 9,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      20,
      1300,
      200,
      22.0
     ],
     "id": "obj-104"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 1.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      1900,
      49,
      22.0
     ],
     "id": "obj-105"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 1.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      120,
      1900,
      49,
      22.0
     ],
     "id": "obj-106"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      20,
      1340,
      200,
      22.0
     ],
     "id": "obj-107"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      20,
      1370,
      49,
      22.0
     ],
     "id": "obj-108"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      1400,
      49,
      22.0
     ],
     "id": "obj-109"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      1430,
      49,
      22.0
     ],
     "id": "obj-110"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      20,
      1460,
      90,
      22.0
     ],
     "id": "obj-111"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      130,
      1370,
      98,
      22.0
     ],
     "id": "obj-112"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      130,
      1430,
      130,
      22.0
     ],
     "id": "obj-113"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      1490,
      40,
      22.0
     ],
     "id": "obj-114"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      130,
      1490,
      49,
      22.0
     ],
     "id": "obj-115"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      1520,
      40,
      22.0
     ],
     "id": "obj-116"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      130,
      1520,
      98,
      22.0
     ],
     "id": "obj-117"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      1550,
      49,
      22.0
     ],
     "id": "obj-118"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      80,
      1550,
      49,
      22.0
     ],
     "id": "obj-119"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      160,
      1580,
      56,
      22.0
     ],
     "id": "obj-120"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      280,
      1340,
      200,
      22.0
     ],
     "id": "obj-121"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      280,
      1370,
      49,
      22.0
     ],
     "id": "obj-122"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      280,
      1400,
      49,
      22.0
     ],
     "id": "obj-123"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      280,
      1430,
      49,
      22.0
     ],
     "id": "obj-124"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      280,
      1460,
      90,
      22.0
     ],
     "id": "obj-125"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      390,
      1370,
      98,
      22.0
     ],
     "id": "obj-126"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      390,
      1430,
      130,
      22.0
     ],
     "id": "obj-127"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      280,
      1490,
      40,
      22.0
     ],
     "id": "obj-128"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      390,
      1490,
      49,
      22.0
     ],
     "id": "obj-129"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      280,
      1520,
      40,
      22.0
     ],
     "id": "obj-130"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      390,
      1520,
      98,
      22.0
     ],
     "id": "obj-131"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      280,
      1550,
      49,
      22.0
     ],
     "id": "obj-132"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      340,
      1550,
      49,
      22.0
     ],
     "id": "obj-133"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      1580,
      56,
      22.0
     ],
     "id": "obj-134"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      540,
      1340,
      200,
      22.0
     ],
     "id": "obj-135"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      540,
      1370,
      49,
      22.0
     ],
     "id": "obj-136"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      540,
      1400,
      49,
      22.0
     ],
     "id": "obj-137"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      540,
      1430,
      49,
      22.0
     ],
     "id": "obj-138"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      540,
      1460,
      90,
      22.0
     ],
     "id": "obj-139"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      650,
      1370,
      98,
      22.0
     ],
     "id": "obj-140"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      650,
      1430,
      130,
      22.0
     ],
     "id": "obj-141"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      540,
      1490,
      40,
      22.0
     ],
     "id": "obj-142"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      650,
      1490,
      49,
      22.0
     ],
     "id": "obj-143"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      540,
      1520,
      40,
      22.0
     ],
     "id": "obj-144"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      650,
      1520,
      98,
      22.0
     ],
     "id": "obj-145"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      540,
      1550,
      49,
      22.0
     ],
     "id": "obj-146"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      600,
      1550,
      49,
      22.0
     ],
     "id": "obj-147"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      1580,
      56,
      22.0
     ],
     "id": "obj-148"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      800,
      1340,
      200,
      22.0
     ],
     "id": "obj-149"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      800,
      1370,
      49,
      22.0
     ],
     "id": "obj-150"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      800,
      1400,
      49,
      22.0
     ],
     "id": "obj-151"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      800,
      1430,
      49,
      22.0
     ],
     "id": "obj-152"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      800,
      1460,
      90,
      22.0
     ],
     "id": "obj-153"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      910,
      1370,
      98,
      22.0
     ],
     "id": "obj-154"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      910,
      1430,
      130,
      22.0
     ],
     "id": "obj-155"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      800,
      1490,
      40,
      22.0
     ],
     "id": "obj-156"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      910,
      1490,
      49,
      22.0
     ],
     "id": "obj-157"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      800,
      1520,
      40,
      22.0
     ],
     "id": "obj-158"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      910,
      1520,
      98,
      22.0
     ],
     "id": "obj-159"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      800,
      1550,
      49,
      22.0
     ],
     "id": "obj-160"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      860,
      1550,
      49,
      22.0
     ],
     "id": "obj-161"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 3",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      940,
      1580,
      56,
      22.0
     ],
     "id": "obj-162"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      1060,
      1340,
      200,
      22.0
     ],
     "id": "obj-163"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1060,
      1370,
      49,
      22.0
     ],
     "id": "obj-164"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1060,
      1400,
      49,
      22.0
     ],
     "id": "obj-165"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1060,
      1430,
      49,
      22.0
     ],
     "id": "obj-166"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1060,
      1460,
      90,
      22.0
     ],
     "id": "obj-167"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1170,
      1370,
      98,
      22.0
     ],
     "id": "obj-168"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1170,
      1430,
      130,
      22.0
     ],
     "id": "obj-169"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1060,
      1490,
      40,
      22.0
     ],
     "id": "obj-170"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1170,
      1490,
      49,
      22.0
     ],
     "id": "obj-171"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1060,
      1520,
      40,
      22.0
     ],
     "id": "obj-172"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1170,
      1520,
      98,
      22.0
     ],
     "id": "obj-173"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1060,
      1550,
      49,
      22.0
     ],
     "id": "obj-174"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1120,
      1550,
      49,
      22.0
     ],
     "id": "obj-175"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 4",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1200,
      1580,
      56,
      22.0
     ],
     "id": "obj-176"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      1320,
      1340,
      200,
      22.0
     ],
     "id": "obj-177"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1320,
      1370,
      49,
      22.0
     ],
     "id": "obj-178"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1320,
      1400,
      49,
      22.0
     ],
     "id": "obj-179"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1320,
      1430,
      49,
      22.0
     ],
     "id": "obj-180"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1320,
      1460,
      90,
      22.0
     ],
     "id": "obj-181"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1430,
      1370,
      98,
      22.0
     ],
     "id": "obj-182"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1430,
      1430,
      130,
      22.0
     ],
     "id": "obj-183"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1320,
      1490,
      40,
      22.0
     ],
     "id": "obj-184"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1430,
      1490,
      49,
      22.0
     ],
     "id": "obj-185"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1320,
      1520,
      40,
      22.0
     ],
     "id": "obj-186"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1430,
      1520,
      98,
      22.0
     ],
     "id": "obj-187"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1320,
      1550,
      49,
      22.0
     ],
     "id": "obj-188"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1380,
      1550,
      49,
      22.0
     ],
     "id": "obj-189"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1460,
      1580,
      56,
      22.0
     ],
     "id": "obj-190"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      1580,
      1340,
      200,
      22.0
     ],
     "id": "obj-191"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1580,
      1370,
      49,
      22.0
     ],
     "id": "obj-192"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1580,
      1400,
      49,
      22.0
     ],
     "id": "obj-193"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1580,
      1430,
      49,
      22.0
     ],
     "id": "obj-194"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1580,
      1460,
      90,
      22.0
     ],
     "id": "obj-195"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1690,
      1370,
      98,
      22.0
     ],
     "id": "obj-196"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1690,
      1430,
      130,
      22.0
     ],
     "id": "obj-197"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1580,
      1490,
      40,
      22.0
     ],
     "id": "obj-198"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1690,
      1490,
      49,
      22.0
     ],
     "id": "obj-199"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1580,
      1520,
      40,
      22.0
     ],
     "id": "obj-200"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1690,
      1520,
      98,
      22.0
     ],
     "id": "obj-201"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1580,
      1550,
      49,
      22.0
     ],
     "id": "obj-202"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1640,
      1550,
      49,
      22.0
     ],
     "id": "obj-203"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 6",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1720,
      1580,
      56,
      22.0
     ],
     "id": "obj-204"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ph ln of tz pn ev",
     "numinlets": 1,
     "numoutlets": 7,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      1840,
      1340,
      200,
      22.0
     ],
     "id": "obj-205"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1840,
      1370,
      49,
      22.0
     ],
     "id": "obj-206"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1840,
      1400,
      49,
      22.0
     ],
     "id": "obj-207"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1840,
      1430,
      49,
      22.0
     ],
     "id": "obj-208"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "play~ ---vc 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1840,
      1460,
      90,
      22.0
     ],
     "id": "obj-209"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1950,
      1370,
      98,
      22.0
     ],
     "id": "obj-210"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "trapezoid~ 0.01 0.99",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1950,
      1430,
      130,
      22.0
     ],
     "id": "obj-211"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1840,
      1490,
      40,
      22.0
     ],
     "id": "obj-212"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      1950,
      1490,
      49,
      22.0
     ],
     "id": "obj-213"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1840,
      1520,
      40,
      22.0
     ],
     "id": "obj-214"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "unpack 0. 0.",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "float"
     ],
     "patching_rect": [
      1950,
      1520,
      98,
      22.0
     ],
     "id": "obj-215"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1840,
      1550,
      49,
      22.0
     ],
     "id": "obj-216"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1900,
      1550,
      49,
      22.0
     ],
     "id": "obj-217"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "vend 7",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1980,
      1580,
      56,
      22.0
     ],
     "id": "obj-218"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ftype cut res crsr crbits drv mku dsend dtime fb rmix rsize",
     "numinlets": 1,
     "numoutlets": 13,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      400,
      1900,
      420,
      22.0
     ],
     "id": "obj-219"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      400,
      1940,
      49,
      22.0
     ],
     "id": "obj-220"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "svf~ 20000 0.1",
     "numinlets": 3,
     "numoutlets": 4,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      1980,
      100,
      22.0
     ],
     "id": "obj-221"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "selector~ 4 1",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      2020,
      100,
      22.0
     ],
     "id": "obj-222"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "degrade~ 1. 24",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      2060,
      100,
      22.0
     ],
     "id": "obj-223"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.3",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      2100,
      56,
      22.0
     ],
     "id": "obj-224"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "tanh~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      2130,
      49,
      22.0
     ],
     "id": "obj-225"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 3.433",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      2160,
      70,
      22.0
     ],
     "id": "obj-226"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "svf~ 20000 0.1",
     "numinlets": 3,
     "numoutlets": 4,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      220,
      1980,
      100,
      22.0
     ],
     "id": "obj-227"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "selector~ 4 1",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      220,
      2020,
      100,
      22.0
     ],
     "id": "obj-228"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "degrade~ 1. 24",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      220,
      2060,
      100,
      22.0
     ],
     "id": "obj-229"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.3",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      220,
      2100,
      56,
      22.0
     ],
     "id": "obj-230"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "tanh~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      220,
      2130,
      49,
      22.0
     ],
     "id": "obj-231"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 3.433",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      220,
      2160,
      70,
      22.0
     ],
     "id": "obj-232"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      460,
      2200,
      49,
      22.0
     ],
     "id": "obj-233"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "tapin~ 4000",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "tapconnect"
     ],
     "patching_rect": [
      460,
      2240,
      90,
      22.0
     ],
     "id": "obj-234"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "tapout~ 250",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      460,
      2270,
      90,
      22.0
     ],
     "id": "obj-235"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "tapin~ 4000",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "tapconnect"
     ],
     "patching_rect": [
      460,
      2300,
      90,
      22.0
     ],
     "id": "obj-236"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "tapout~ 250",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      460,
      2330,
      90,
      22.0
     ],
     "id": "obj-237"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "onepole~ 5000",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      460,
      2360,
      90,
      22.0
     ],
     "id": "obj-238"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.4",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      460,
      2390,
      56,
      22.0
     ],
     "id": "obj-239"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "tanh~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      460,
      2420,
      49,
      22.0
     ],
     "id": "obj-240"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.2",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      700,
      2200,
      56,
      22.0
     ],
     "id": "obj-241"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "onepole~ 4500",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      700,
      2300,
      90,
      22.0
     ],
     "id": "obj-242"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "comb~ 100 29.7 0. 1. 0.84",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      700,
      2240,
      125,
      22.0
     ],
     "id": "obj-243"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "comb~ 100 37.1 0. 1. 0.83",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      830,
      2240,
      125,
      22.0
     ],
     "id": "obj-244"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "comb~ 100 41.1 0. 1. 0.82",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      960,
      2240,
      125,
      22.0
     ],
     "id": "obj-245"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "comb~ 100 43.7 0. 1. 0.81",
     "numinlets": 5,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1090,
      2240,
      125,
      22.0
     ],
     "id": "obj-246"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "allpass~ 50 5.1 0.6",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      700,
      2340,
      110,
      22.0
     ],
     "id": "obj-247"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "allpass~ 50 1.7 0.6",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      700,
      2370,
      110,
      22.0
     ],
     "id": "obj-248"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      700,
      2400,
      49,
      22.0
     ],
     "id": "obj-249"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "allpass~ 50 6.3 0.6",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      900,
      2340,
      110,
      22.0
     ],
     "id": "obj-250"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "allpass~ 50 2.9 0.6",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      900,
      2370,
      110,
      22.0
     ],
     "id": "obj-251"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      900,
      2400,
      49,
      22.0
     ],
     "id": "obj-252"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "clip~ -1. 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      2460,
      90,
      22.0
     ],
     "id": "obj-253"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "clip~ -1. 1.",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      220,
      2460,
      90,
      22.0
     ],
     "id": "obj-254"
    }
   },
   {
    "box": {
     "maxclass": "live.gain~",
     "numinlets": 2,
     "numoutlets": 5,
     "outlettype": [
      "signal",
      "signal",
      "",
      "float",
      "list"
     ],
     "patching_rect": [
      20,
      2500,
      40,
      136
     ],
     "presentation": 1,
     "presentation_rect": [
      1024,
      4,
      40,
      160
     ],
     "parameter_enable": 1,
     "varname": "Volume",
     "channels": 2,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Volume",
       "parameter_shortname": "Volume",
       "parameter_type": 0,
       "parameter_mmin": -70.0,
       "parameter_mmax": 6.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0
      }
     },
     "id": "obj-255"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "plugout~",
     "numinlets": 2,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      20,
      2660,
      70,
      22.0
     ],
     "id": "obj-256"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-1",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      2
     ],
     "destination": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-4",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      0
     ],
     "destination": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      1
     ],
     "destination": [
      "obj-7",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7",
      0
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      1
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-14",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      1
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      1
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-17",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      2
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      0
     ],
     "destination": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-19",
      1
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-20",
      0
     ],
     "destination": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-21",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      1
     ],
     "destination": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      6
     ],
     "destination": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      5
     ],
     "destination": [
      "obj-23",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-23",
      0
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      3
     ],
     "destination": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-28",
      0
     ],
     "destination": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      0
     ],
     "destination": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-33",
      0
     ],
     "destination": [
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      4
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-36",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-39",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      0
     ],
     "destination": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-40",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-42",
      0
     ],
     "destination": [
      "obj-43",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-43",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-45",
      0
     ],
     "destination": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      0
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-41",
      0
     ],
     "destination": [
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-50",
      0
     ],
     "destination": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      0
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-52",
      0
     ],
     "destination": [
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-31",
      0
     ],
     "destination": [
      "obj-76",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-32",
      0
     ],
     "destination": [
      "obj-77",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-77",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-78",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-44",
      0
     ],
     "destination": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-79",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-48",
      0
     ],
     "destination": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-80",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-53",
      0
     ],
     "destination": [
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-81",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-54",
      0
     ],
     "destination": [
      "obj-82",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-82",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-55",
      0
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-83",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-56",
      0
     ],
     "destination": [
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-84",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-57",
      0
     ],
     "destination": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-85",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-58",
      0
     ],
     "destination": [
      "obj-86",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-86",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-59",
      0
     ],
     "destination": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-60",
      0
     ],
     "destination": [
      "obj-88",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-88",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-61",
      0
     ],
     "destination": [
      "obj-89",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-89",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-62",
      0
     ],
     "destination": [
      "obj-90",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-90",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-63",
      0
     ],
     "destination": [
      "obj-91",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-91",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-64",
      0
     ],
     "destination": [
      "obj-92",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-92",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-65",
      0
     ],
     "destination": [
      "obj-93",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-93",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-66",
      0
     ],
     "destination": [
      "obj-94",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-67",
      0
     ],
     "destination": [
      "obj-95",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
      0
     ],
     "destination": [
      "obj-96",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-97",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-97",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      0
     ],
     "destination": [
      "obj-98",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-98",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-71",
      0
     ],
     "destination": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-99",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      0
     ],
     "destination": [
      "obj-100",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-100",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-73",
      0
     ],
     "destination": [
      "obj-101",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-101",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-74",
      0
     ],
     "destination": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-75",
      0
     ],
     "destination": [
      "obj-103",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-103",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-55",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-56",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-58",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-60",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-62",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-63",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-64",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-65",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-66",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-71",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      0
     ],
     "destination": [
      "obj-104",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      0
     ],
     "destination": [
      "obj-107",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      0
     ],
     "destination": [
      "obj-108",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      1
     ],
     "destination": [
      "obj-109",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      2
     ],
     "destination": [
      "obj-110",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      3
     ],
     "destination": [
      "obj-112",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-112",
      0
     ],
     "destination": [
      "obj-113",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-112",
      1
     ],
     "destination": [
      "obj-113",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      4
     ],
     "destination": [
      "obj-117",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-117",
      0
     ],
     "destination": [
      "obj-118",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-117",
      1
     ],
     "destination": [
      "obj-119",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      5
     ],
     "destination": [
      "obj-115",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-108",
      0
     ],
     "destination": [
      "obj-109",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-109",
      0
     ],
     "destination": [
      "obj-110",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-110",
      0
     ],
     "destination": [
      "obj-111",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-108",
      0
     ],
     "destination": [
      "obj-113",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-111",
      0
     ],
     "destination": [
      "obj-114",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-113",
      0
     ],
     "destination": [
      "obj-114",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-114",
      0
     ],
     "destination": [
      "obj-116",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-115",
      0
     ],
     "destination": [
      "obj-116",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-116",
      0
     ],
     "destination": [
      "obj-118",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-116",
      0
     ],
     "destination": [
      "obj-119",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-118",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-119",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-108",
      1
     ],
     "destination": [
      "obj-120",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-120",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      1
     ],
     "destination": [
      "obj-121",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      0
     ],
     "destination": [
      "obj-122",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      1
     ],
     "destination": [
      "obj-123",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      2
     ],
     "destination": [
      "obj-124",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      3
     ],
     "destination": [
      "obj-126",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-126",
      0
     ],
     "destination": [
      "obj-127",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-126",
      1
     ],
     "destination": [
      "obj-127",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      4
     ],
     "destination": [
      "obj-131",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      0
     ],
     "destination": [
      "obj-132",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      1
     ],
     "destination": [
      "obj-133",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      5
     ],
     "destination": [
      "obj-129",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-123",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-123",
      0
     ],
     "destination": [
      "obj-124",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-124",
      0
     ],
     "destination": [
      "obj-125",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-127",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-125",
      0
     ],
     "destination": [
      "obj-128",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-128",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-128",
      0
     ],
     "destination": [
      "obj-130",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-130",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-130",
      0
     ],
     "destination": [
      "obj-132",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-130",
      0
     ],
     "destination": [
      "obj-133",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-132",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-133",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      1
     ],
     "destination": [
      "obj-134",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-134",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      2
     ],
     "destination": [
      "obj-135",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      0
     ],
     "destination": [
      "obj-136",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      1
     ],
     "destination": [
      "obj-137",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      2
     ],
     "destination": [
      "obj-138",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      3
     ],
     "destination": [
      "obj-140",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      0
     ],
     "destination": [
      "obj-141",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      1
     ],
     "destination": [
      "obj-141",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      4
     ],
     "destination": [
      "obj-145",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-145",
      0
     ],
     "destination": [
      "obj-146",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-145",
      1
     ],
     "destination": [
      "obj-147",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      5
     ],
     "destination": [
      "obj-143",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      0
     ],
     "destination": [
      "obj-137",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-137",
      0
     ],
     "destination": [
      "obj-138",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-138",
      0
     ],
     "destination": [
      "obj-139",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      0
     ],
     "destination": [
      "obj-141",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-139",
      0
     ],
     "destination": [
      "obj-142",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-141",
      0
     ],
     "destination": [
      "obj-142",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-142",
      0
     ],
     "destination": [
      "obj-144",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-143",
      0
     ],
     "destination": [
      "obj-144",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-144",
      0
     ],
     "destination": [
      "obj-146",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-144",
      0
     ],
     "destination": [
      "obj-147",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-146",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-147",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      1
     ],
     "destination": [
      "obj-148",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      3
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      0
     ],
     "destination": [
      "obj-150",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      1
     ],
     "destination": [
      "obj-151",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      2
     ],
     "destination": [
      "obj-152",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      3
     ],
     "destination": [
      "obj-154",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-154",
      0
     ],
     "destination": [
      "obj-155",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-154",
      1
     ],
     "destination": [
      "obj-155",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      4
     ],
     "destination": [
      "obj-159",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-159",
      0
     ],
     "destination": [
      "obj-160",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-159",
      1
     ],
     "destination": [
      "obj-161",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      5
     ],
     "destination": [
      "obj-157",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-150",
      0
     ],
     "destination": [
      "obj-151",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      0
     ],
     "destination": [
      "obj-152",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-152",
      0
     ],
     "destination": [
      "obj-153",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-150",
      0
     ],
     "destination": [
      "obj-155",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-153",
      0
     ],
     "destination": [
      "obj-156",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-155",
      0
     ],
     "destination": [
      "obj-156",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-156",
      0
     ],
     "destination": [
      "obj-158",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-157",
      0
     ],
     "destination": [
      "obj-158",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-158",
      0
     ],
     "destination": [
      "obj-160",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-158",
      0
     ],
     "destination": [
      "obj-161",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-160",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-161",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-150",
      1
     ],
     "destination": [
      "obj-162",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-162",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      4
     ],
     "destination": [
      "obj-163",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      0
     ],
     "destination": [
      "obj-164",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      1
     ],
     "destination": [
      "obj-165",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      2
     ],
     "destination": [
      "obj-166",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      3
     ],
     "destination": [
      "obj-168",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-168",
      0
     ],
     "destination": [
      "obj-169",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-168",
      1
     ],
     "destination": [
      "obj-169",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      4
     ],
     "destination": [
      "obj-173",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      0
     ],
     "destination": [
      "obj-174",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      1
     ],
     "destination": [
      "obj-175",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      5
     ],
     "destination": [
      "obj-171",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-164",
      0
     ],
     "destination": [
      "obj-165",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-165",
      0
     ],
     "destination": [
      "obj-166",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-166",
      0
     ],
     "destination": [
      "obj-167",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-164",
      0
     ],
     "destination": [
      "obj-169",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-167",
      0
     ],
     "destination": [
      "obj-170",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-169",
      0
     ],
     "destination": [
      "obj-170",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-170",
      0
     ],
     "destination": [
      "obj-172",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-172",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      0
     ],
     "destination": [
      "obj-174",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      0
     ],
     "destination": [
      "obj-175",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-164",
      1
     ],
     "destination": [
      "obj-176",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-176",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      5
     ],
     "destination": [
      "obj-177",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      0
     ],
     "destination": [
      "obj-178",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      1
     ],
     "destination": [
      "obj-179",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      2
     ],
     "destination": [
      "obj-180",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      3
     ],
     "destination": [
      "obj-182",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      0
     ],
     "destination": [
      "obj-183",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      1
     ],
     "destination": [
      "obj-183",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      4
     ],
     "destination": [
      "obj-187",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-187",
      0
     ],
     "destination": [
      "obj-188",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-187",
      1
     ],
     "destination": [
      "obj-189",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      5
     ],
     "destination": [
      "obj-185",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-178",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-179",
      0
     ],
     "destination": [
      "obj-180",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-180",
      0
     ],
     "destination": [
      "obj-181",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-178",
      0
     ],
     "destination": [
      "obj-183",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-181",
      0
     ],
     "destination": [
      "obj-184",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-183",
      0
     ],
     "destination": [
      "obj-184",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-184",
      0
     ],
     "destination": [
      "obj-186",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-185",
      0
     ],
     "destination": [
      "obj-186",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-186",
      0
     ],
     "destination": [
      "obj-188",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-186",
      0
     ],
     "destination": [
      "obj-189",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-188",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-189",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-178",
      1
     ],
     "destination": [
      "obj-190",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-190",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      6
     ],
     "destination": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      0
     ],
     "destination": [
      "obj-192",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      1
     ],
     "destination": [
      "obj-193",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      2
     ],
     "destination": [
      "obj-194",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      3
     ],
     "destination": [
      "obj-196",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-196",
      0
     ],
     "destination": [
      "obj-197",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-196",
      1
     ],
     "destination": [
      "obj-197",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      4
     ],
     "destination": [
      "obj-201",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-201",
      0
     ],
     "destination": [
      "obj-202",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-201",
      1
     ],
     "destination": [
      "obj-203",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      5
     ],
     "destination": [
      "obj-199",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-192",
      0
     ],
     "destination": [
      "obj-193",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      0
     ],
     "destination": [
      "obj-194",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-194",
      0
     ],
     "destination": [
      "obj-195",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-192",
      0
     ],
     "destination": [
      "obj-197",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-195",
      0
     ],
     "destination": [
      "obj-198",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-197",
      0
     ],
     "destination": [
      "obj-198",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-198",
      0
     ],
     "destination": [
      "obj-200",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-199",
      0
     ],
     "destination": [
      "obj-200",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-200",
      0
     ],
     "destination": [
      "obj-202",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-200",
      0
     ],
     "destination": [
      "obj-203",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-202",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-203",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-192",
      1
     ],
     "destination": [
      "obj-204",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-204",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      7
     ],
     "destination": [
      "obj-205",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      0
     ],
     "destination": [
      "obj-206",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      1
     ],
     "destination": [
      "obj-207",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      2
     ],
     "destination": [
      "obj-208",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      3
     ],
     "destination": [
      "obj-210",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-210",
      0
     ],
     "destination": [
      "obj-211",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-210",
      1
     ],
     "destination": [
      "obj-211",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      4
     ],
     "destination": [
      "obj-215",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-215",
      0
     ],
     "destination": [
      "obj-216",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-215",
      1
     ],
     "destination": [
      "obj-217",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      5
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-206",
      0
     ],
     "destination": [
      "obj-207",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-207",
      0
     ],
     "destination": [
      "obj-208",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-208",
      0
     ],
     "destination": [
      "obj-209",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-206",
      0
     ],
     "destination": [
      "obj-211",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-209",
      0
     ],
     "destination": [
      "obj-212",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-211",
      0
     ],
     "destination": [
      "obj-212",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-214",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-214",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-214",
      0
     ],
     "destination": [
      "obj-216",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-214",
      0
     ],
     "destination": [
      "obj-217",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-216",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-217",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-206",
      1
     ],
     "destination": [
      "obj-218",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-218",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      2
     ],
     "destination": [
      "obj-219",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      1
     ],
     "destination": [
      "obj-220",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-105",
      0
     ],
     "destination": [
      "obj-221",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      0
     ],
     "destination": [
      "obj-221",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      2
     ],
     "destination": [
      "obj-221",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      0
     ],
     "destination": [
      "obj-222",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-105",
      0
     ],
     "destination": [
      "obj-222",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-221",
      0
     ],
     "destination": [
      "obj-222",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-221",
      1
     ],
     "destination": [
      "obj-222",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-221",
      2
     ],
     "destination": [
      "obj-222",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-222",
      0
     ],
     "destination": [
      "obj-223",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      3
     ],
     "destination": [
      "obj-223",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      4
     ],
     "destination": [
      "obj-223",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-223",
      0
     ],
     "destination": [
      "obj-224",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      5
     ],
     "destination": [
      "obj-224",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-224",
      0
     ],
     "destination": [
      "obj-225",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-225",
      0
     ],
     "destination": [
      "obj-226",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      6
     ],
     "destination": [
      "obj-226",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-106",
      0
     ],
     "destination": [
      "obj-227",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      0
     ],
     "destination": [
      "obj-227",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      2
     ],
     "destination": [
      "obj-227",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      0
     ],
     "destination": [
      "obj-228",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-106",
      0
     ],
     "destination": [
      "obj-228",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-227",
      0
     ],
     "destination": [
      "obj-228",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-227",
      1
     ],
     "destination": [
      "obj-228",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-227",
      2
     ],
     "destination": [
      "obj-228",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-228",
      0
     ],
     "destination": [
      "obj-229",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      3
     ],
     "destination": [
      "obj-229",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      4
     ],
     "destination": [
      "obj-229",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-229",
      0
     ],
     "destination": [
      "obj-230",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      5
     ],
     "destination": [
      "obj-230",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-230",
      0
     ],
     "destination": [
      "obj-231",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-231",
      0
     ],
     "destination": [
      "obj-232",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      6
     ],
     "destination": [
      "obj-232",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-232",
      0
     ],
     "destination": [
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      7
     ],
     "destination": [
      "obj-233",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-233",
      0
     ],
     "destination": [
      "obj-234",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-234",
      0
     ],
     "destination": [
      "obj-235",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      0
     ],
     "destination": [
      "obj-236",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-236",
      0
     ],
     "destination": [
      "obj-237",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-237",
      0
     ],
     "destination": [
      "obj-238",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-238",
      0
     ],
     "destination": [
      "obj-239",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-239",
      0
     ],
     "destination": [
      "obj-240",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-240",
      0
     ],
     "destination": [
      "obj-234",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      8
     ],
     "destination": [
      "obj-235",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      8
     ],
     "destination": [
      "obj-237",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      9
     ],
     "destination": [
      "obj-239",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-241",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-232",
      0
     ],
     "destination": [
      "obj-241",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      0
     ],
     "destination": [
      "obj-241",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-237",
      0
     ],
     "destination": [
      "obj-241",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-241",
      0
     ],
     "destination": [
      "obj-243",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      11
     ],
     "destination": [
      "obj-243",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-243",
      0
     ],
     "destination": [
      "obj-242",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-241",
      0
     ],
     "destination": [
      "obj-244",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      11
     ],
     "destination": [
      "obj-244",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-244",
      0
     ],
     "destination": [
      "obj-242",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-241",
      0
     ],
     "destination": [
      "obj-245",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      11
     ],
     "destination": [
      "obj-245",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-245",
      0
     ],
     "destination": [
      "obj-242",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-241",
      0
     ],
     "destination": [
      "obj-246",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      11
     ],
     "destination": [
      "obj-246",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-246",
      0
     ],
     "destination": [
      "obj-242",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-242",
      0
     ],
     "destination": [
      "obj-247",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-247",
      0
     ],
     "destination": [
      "obj-248",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-248",
      0
     ],
     "destination": [
      "obj-249",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      10
     ],
     "destination": [
      "obj-249",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-242",
      0
     ],
     "destination": [
      "obj-250",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-250",
      0
     ],
     "destination": [
      "obj-251",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-251",
      0
     ],
     "destination": [
      "obj-252",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      10
     ],
     "destination": [
      "obj-252",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-253",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      0
     ],
     "destination": [
      "obj-253",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-249",
      0
     ],
     "destination": [
      "obj-253",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-232",
      0
     ],
     "destination": [
      "obj-254",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-237",
      0
     ],
     "destination": [
      "obj-254",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-252",
      0
     ],
     "destination": [
      "obj-254",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-253",
      0
     ],
     "destination": [
      "obj-255",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-254",
      0
     ],
     "destination": [
      "obj-255",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-256",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      1
     ],
     "destination": [
      "obj-256",
      1
     ]
    }
   }
  ],
  "openrect": [
   0.0,
   0.0,
   1068.0,
   169.0
  ]
 }
}