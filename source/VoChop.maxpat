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
  "devicewidth": 1128.0,
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
      172,
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
     "text": "route buf bus fx setrec pattr node lrec inmenu chmenu banks setparam",
     "numinlets": 1,
     "numoutlets": 12,
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
      ""
     ],
     "patching_rect": [
      20,
      700,
      520,
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
     "maxclass": "newobj",
     "text": "live.banks",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      760,
      760,
      84,
      22.0
     ],
     "id": "obj-25"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend bankmsg",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      760,
      790,
      119,
      22.0
     ],
     "id": "obj-26"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "plugin~ 1 2 3 4",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      1200,
      20,
      110,
      22.0
     ],
     "id": "obj-27"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1200,
      60,
      40,
      22.0
     ],
     "id": "obj-28"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "*~ 0.5",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1200,
      90,
      56,
      22.0
     ],
     "id": "obj-29"
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
      1200,
      120,
      49,
      22.0
     ],
     "id": "obj-30"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "record~ ---vc 1",
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1200,
      220,
      120,
      22.0
     ],
     "id": "obj-31"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1200,
      250,
      77,
      22.0
     ],
     "id": "obj-32"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend lfrac",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1200,
      280,
      105,
      22.0
     ],
     "id": "obj-33"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sel 0",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      1340,
      160,
      49,
      22.0
     ],
     "id": "obj-34"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "deferlow",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      190,
      70,
      22.0
     ],
     "id": "obj-35"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t 0 b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "bang"
     ],
     "patching_rect": [
      1340,
      220,
      49,
      22.0
     ],
     "id": "obj-36"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "peakamp~ 30",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1340,
      120,
      91,
      22.0
     ],
     "id": "obj-37"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend lvl",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      280,
      91,
      22.0
     ],
     "id": "obj-38"
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
      1460,
      120,
      49,
      22.0
     ],
     "id": "obj-39"
    }
   },
   {
    "box": {
     "maxclass": "umenu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "",
      ""
     ],
     "patching_rect": [
      1460,
      20,
      112,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      52,
      112,
      16
     ],
     "parameter_enable": 0,
     "varname": "AudioFrom",
     "items": [
      "(press",
      "REC)"
     ],
     "fontsize": 9.0,
     "id": "obj-40"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend insel",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1460,
      50,
      105,
      22.0
     ],
     "id": "obj-41"
    }
   },
   {
    "box": {
     "maxclass": "umenu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "int",
      "",
      ""
     ],
     "patching_rect": [
      1600,
      20,
      44,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      122,
      52,
      44,
      16
     ],
     "parameter_enable": 0,
     "varname": "AudioChan",
     "items": [
      "1/2"
     ],
     "fontsize": 9.0,
     "id": "obj-42"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend chsel",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1600,
      50,
      105,
      22.0
     ],
     "id": "obj-43"
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
      20,
      940,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      24,
      52,
      24
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
     "id": "obj-45"
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
     "id": "obj-46"
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
     "id": "obj-47"
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
      80,
      940,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      62,
      24,
      38,
      24
     ],
     "mode": 0,
     "text": "UNDO",
     "texton": "UNDO",
     "varname": "Undo",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Undo",
       "parameter_shortname": "Undo",
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
     "id": "obj-48"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend undo",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      80,
      1000,
      98,
      22.0
     ],
     "id": "obj-49"
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
      102,
      24,
      64,
      24
     ],
     "parameter_enable": 0,
     "id": "obj-50"
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
     "id": "obj-51"
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
      320,
      900,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      8,
      70,
      40,
      16
     ],
     "mode": 1,
     "text": "AUTO",
     "texton": "AUTO",
     "varname": "Auto",
     "activebgoncolor": [
      1.0,
      0.6,
      0.2,
      1.0
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Auto",
       "parameter_shortname": "Auto",
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
     "id": "obj-52"
    }
   },
   {
    "box": {
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "list"
     ],
     "patching_rect": [
      1460,
      90,
      70,
      10
     ],
     "presentation": 1,
     "presentation_rect": [
      50,
      73,
      70,
      10
     ],
     "orientation": 1,
     "id": "obj-53"
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
      380,
      900,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      122,
      70,
      44,
      16
     ],
     "mode": 1,
     "text": "THRU",
     "texton": "THRU",
     "varname": "Thru",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Thru",
       "parameter_shortname": "Thru",
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
     "id": "obj-54"
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
      90,
      78,
      16
     ],
     "parameter_enable": 1,
     "varname": "Layout",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Layout",
       "parameter_shortname": "Layout",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 2.0,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "Words",
        "Notes",
        "Seq"
       ]
      }
     },
     "id": "obj-55"
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
      88,
      90,
      78,
      16
     ],
     "parameter_enable": 1,
     "varname": "Keys",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Keys",
       "parameter_shortname": "Keys",
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
        "Cloud",
        "Loop",
        "Repeat",
        "One-Shot"
       ]
      }
     },
     "id": "obj-56"
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
      8,
      110,
      24,
      16
     ],
     "mode": 0,
     "text": "<",
     "texton": "<",
     "varname": "TakePrev",
     "parameter_enable": 0,
     "id": "obj-57"
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
      34,
      110,
      24,
      16
     ],
     "mode": 0,
     "text": ">",
     "texton": ">",
     "varname": "TakeNext",
     "parameter_enable": 0,
     "id": "obj-58"
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
     "id": "obj-59"
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
     "id": "obj-60"
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
      380,
      1010,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      62,
      110,
      50,
      16
     ],
     "mode": 0,
     "text": "OCT -",
     "texton": "OCT -",
     "varname": "OctDown",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "OctDown",
       "parameter_shortname": "OctDown",
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
     "id": "obj-61"
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
      440,
      1010,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      116,
      110,
      50,
      16
     ],
     "mode": 0,
     "text": "OCT +",
     "texton": "OCT +",
     "varname": "OctUp",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "OctUp",
       "parameter_shortname": "OctUp",
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
     "id": "obj-62"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend octdown",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      380,
      1040,
      119,
      22.0
     ],
     "id": "obj-63"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend octup",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      440,
      1070,
      105,
      22.0
     ],
     "id": "obj-64"
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
      130,
      78,
      16
     ],
     "mode": 0,
     "text": "BIG VIEW",
     "texton": "BIG VIEW",
     "varname": "BigView",
     "parameter_enable": 0,
     "id": "obj-65"
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
      130,
      78,
      16
     ],
     "mode": 0,
     "text": "MAKE CLIP",
     "texton": "MAKE CLIP",
     "varname": "MakeClip",
     "parameter_enable": 0,
     "id": "obj-66"
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
     "id": "obj-67"
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
      150,
      78,
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
     "id": "obj-68"
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
      150,
      78,
      16
     ],
     "mode": 1,
     "text": "PUSH PADS",
     "texton": "PUSH PADS",
     "varname": "Push",
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Push",
       "parameter_shortname": "Push",
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
     "id": "obj-69"
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
     "id": "obj-70"
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
     "id": "obj-71"
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
     "id": "obj-72"
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
         "id": "obj-1"
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
         "id": "obj-2"
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
         "id": "obj-3"
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
          0
         ],
         "destination": [
          "obj-3",
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
     "id": "obj-73"
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
     "id": "obj-74"
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
     "id": "obj-75"
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
     "id": "obj-76"
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
     "id": "obj-77"
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
     "varname": "AutoTune",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "AutoTune",
       "parameter_shortname": "Tune",
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
     "id": "obj-78"
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
     "varname": "Key",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Key",
       "parameter_shortname": "Key",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 12.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "Scale",
        "C",
        "C#",
        "D",
        "D#",
        "E",
        "F",
        "F#",
        "G",
        "G#",
        "A",
        "A#",
        "B"
       ]
      }
     },
     "id": "obj-79"
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
     "id": "obj-80"
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
     "varname": "Release",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Release",
       "parameter_shortname": "Release",
       "parameter_type": 0,
       "parameter_mmin": 5.0,
       "parameter_mmax": 4000.0,
       "parameter_initial": [
        250
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-81"
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
     "varname": "Grain",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Grain",
       "parameter_shortname": "Grain",
       "parameter_type": 0,
       "parameter_mmin": 20.0,
       "parameter_mmax": 400.0,
       "parameter_initial": [
        120
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-82"
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
     "varname": "Rate",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Rate",
       "parameter_shortname": "Rate",
       "parameter_type": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 5.0,
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1/4",
        "1/8",
        "1/16",
        "1/32",
        "1/8T",
        "1/16T"
       ]
      }
     },
     "id": "obj-83"
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
     "id": "obj-84"
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
     "id": "obj-85"
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
     "id": "obj-86"
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
     "id": "obj-87"
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
     "id": "obj-88"
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
     "id": "obj-89"
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
     "id": "obj-90"
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
     "id": "obj-91"
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
     "id": "obj-92"
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
     "id": "obj-93"
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
     "id": "obj-94"
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
     "id": "obj-95"
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
      160,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      928,
      112,
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
     "id": "obj-96"
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
      160,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      974,
      112,
      44,
      52
     ],
     "parameter_enable": 1,
     "varname": "Thresh",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Thresh",
       "parameter_shortname": "Thresh",
       "parameter_type": 0,
       "parameter_mmin": -70.0,
       "parameter_mmax": 0.0,
       "parameter_initial": [
        -40
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0
      }
     },
     "id": "obj-97"
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
      1300,
      300,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      4,
      56,
      15
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
     "id": "obj-98"
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
      1360,
      300,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      22,
      56,
      15
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
     "id": "obj-99"
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
      1420,
      300,
      100,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      40,
      56,
      15
     ],
     "parameter_enable": 1,
     "varname": "Pads",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Pads",
       "parameter_shortname": "Pads",
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
        "One-Shot",
        "Gate",
        "Loop",
        "Repeat"
       ]
      }
     },
     "id": "obj-100"
    }
   },
   {
    "box": {
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1300,
      398,
      120,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      57,
      30,
      15
     ],
     "text": "Oct",
     "fontsize": 8.5,
     "fontface": 0,
     "id": "obj-101"
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
      1360,
      398,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1048,
      58,
      30,
      15
     ],
     "parameter_enable": 1,
     "varname": "Octave",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Octave",
       "parameter_shortname": "Octave",
       "parameter_type": 1,
       "parameter_mmin": -1.0,
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_invisible": 0
      }
     },
     "id": "obj-102"
    }
   },
   {
    "box": {
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1300,
      434,
      120,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      93,
      30,
      15
     ],
     "text": "Poly",
     "fontsize": 8.5,
     "fontface": 0,
     "id": "obj-103"
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
      1360,
      434,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1048,
      94,
      30,
      15
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
     "id": "obj-104"
    }
   },
   {
    "box": {
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1300,
      452,
      120,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      111,
      30,
      15
     ],
     "text": "Vel",
     "fontsize": 8.5,
     "fontface": 0,
     "id": "obj-105"
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
      1360,
      452,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1048,
      112,
      30,
      15
     ],
     "parameter_enable": 1,
     "varname": "Velocity",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Velocity",
       "parameter_shortname": "Velocity",
       "parameter_type": 1,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        70
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_invisible": 0
      }
     },
     "id": "obj-106"
    }
   },
   {
    "box": {
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1300,
      470,
      120,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      129,
      30,
      15
     ],
     "text": "In dB",
     "fontsize": 8.5,
     "fontface": 0,
     "id": "obj-107"
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
      1360,
      470,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1048,
      130,
      30,
      15
     ],
     "parameter_enable": 1,
     "varname": "InGain",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "InGain",
       "parameter_shortname": "InGain",
       "parameter_type": 1,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_invisible": 0
      }
     },
     "id": "obj-108"
    }
   },
   {
    "box": {
     "maxclass": "live.comment",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1300,
      420,
      120,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      75,
      30,
      15
     ],
     "text": "Page",
     "fontsize": 8.5,
     "fontface": 0,
     "id": "obj-109"
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
      1360,
      420,
      100,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1048,
      76,
      30,
      15
     ],
     "parameter_enable": 1,
     "varname": "Page",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Page",
       "parameter_shortname": "Page",
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
        "1-8",
        "9-16",
        "17-24",
        "25-32"
       ]
      }
     },
     "id": "obj-110"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "dbtoa",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1360,
      520,
      49,
      22.0
     ],
     "id": "obj-111"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route octave page",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      1500,
      420,
      120,
      22.0
     ],
     "id": "obj-112"
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
      1500,
      450,
      91,
      22.0
     ],
     "id": "obj-113"
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
      1580,
      450,
      91,
      22.0
     ],
     "id": "obj-114"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p autorec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      320,
      921,
      110,
      22
     ],
     "id": "obj-115"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p layout",
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
     "id": "obj-116"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p keys",
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
     "id": "obj-117"
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
     "id": "obj-118"
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
     "id": "obj-119"
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
     "id": "obj-120"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p atune",
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
     "id": "obj-121"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p key",
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
     "id": "obj-122"
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
      980,
      74,
      110,
      22
     ],
     "id": "obj-123"
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
      1040,
      74,
      110,
      22
     ],
     "id": "obj-124"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p grain",
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
     "id": "obj-125"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p rate",
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
     "id": "obj-126"
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
     "id": "obj-127"
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
     "id": "obj-128"
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
     "id": "obj-129"
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
     "id": "obj-130"
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
     "id": "obj-131"
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
     "id": "obj-132"
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
     "id": "obj-133"
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
     "id": "obj-134"
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
     "id": "obj-135"
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
     "id": "obj-136"
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
     "id": "obj-137"
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
     "id": "obj-138"
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
      1100,
      214,
      110,
      22
     ],
     "id": "obj-139"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p thresh",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1160,
      214,
      110,
      22
     ],
     "id": "obj-140"
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
      1300,
      321,
      110,
      22
     ],
     "id": "obj-141"
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
      1360,
      321,
      110,
      22
     ],
     "id": "obj-142"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p pads",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1420,
      321,
      110,
      22
     ],
     "id": "obj-143"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p octave",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1360,
      419,
      110,
      22
     ],
     "id": "obj-144"
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
      1360,
      455,
      110,
      22
     ],
     "id": "obj-145"
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
      1360,
      473,
      110,
      22
     ],
     "id": "obj-146"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend p page",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1360,
      441,
      110,
      22
     ],
     "id": "obj-147"
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
     "id": "obj-148"
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
      2000,
      49,
      22.0
     ],
     "id": "obj-149"
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
      2000,
      49,
      22.0
     ],
     "id": "obj-150"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
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
      160,
      22.0
     ],
     "id": "obj-151"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
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
      20,
      1430,
      72,
      22.0
     ],
     "id": "obj-153"
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
      1460,
      40,
      22.0
     ],
     "id": "obj-154"
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
      96,
      1430,
      72,
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
      96,
      1460,
      40,
      22.0
     ],
     "id": "obj-156"
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
      172,
      1430,
      72,
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
      172,
      1460,
      40,
      22.0
     ],
     "id": "obj-158"
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
      248,
      1430,
      72,
      22.0
     ],
     "id": "obj-159"
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
      248,
      1460,
      40,
      22.0
     ],
     "id": "obj-160"
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
      324,
      1430,
      72,
      22.0
     ],
     "id": "obj-161"
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
      324,
      1460,
      40,
      22.0
     ],
     "id": "obj-162"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      1500,
      40,
      22.0
     ],
     "id": "obj-163"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      20,
      1560,
      80,
      22.0
     ],
     "id": "obj-164"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      120,
      1530,
      42,
      22.0
     ],
     "id": "obj-165"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      1500,
      100,
      22.0
     ],
     "id": "obj-166"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      1530,
      160,
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
      220,
      1560,
      98,
      22.0
     ],
     "id": "obj-168"
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
      1600,
      49,
      22.0
     ],
     "id": "obj-169"
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
      1600,
      49,
      22.0
     ],
     "id": "obj-170"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      320,
      1430,
      49,
      22.0
     ],
     "id": "obj-171"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      320,
      1460,
      77,
      22.0
     ],
     "id": "obj-172"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      320,
      1490,
      100,
      22.0
     ],
     "id": "obj-173"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      440,
      1340,
      160,
      22.0
     ],
     "id": "obj-174"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      440,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-175"
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
      440,
      1430,
      72,
      22.0
     ],
     "id": "obj-176"
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
      440,
      1460,
      40,
      22.0
     ],
     "id": "obj-177"
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
      516,
      1430,
      72,
      22.0
     ],
     "id": "obj-178"
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
      516,
      1460,
      40,
      22.0
     ],
     "id": "obj-179"
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
      592,
      1430,
      72,
      22.0
     ],
     "id": "obj-180"
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
      592,
      1460,
      40,
      22.0
     ],
     "id": "obj-181"
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
      668,
      1430,
      72,
      22.0
     ],
     "id": "obj-182"
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
      668,
      1460,
      40,
      22.0
     ],
     "id": "obj-183"
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
      744,
      1430,
      72,
      22.0
     ],
     "id": "obj-184"
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
      744,
      1460,
      40,
      22.0
     ],
     "id": "obj-185"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      440,
      1500,
      40,
      22.0
     ],
     "id": "obj-186"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      440,
      1560,
      80,
      22.0
     ],
     "id": "obj-187"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      540,
      1530,
      42,
      22.0
     ],
     "id": "obj-188"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      600,
      1500,
      100,
      22.0
     ],
     "id": "obj-189"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      600,
      1530,
      160,
      22.0
     ],
     "id": "obj-190"
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
      640,
      1560,
      98,
      22.0
     ],
     "id": "obj-191"
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
      440,
      1600,
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
      500,
      1600,
      49,
      22.0
     ],
     "id": "obj-193"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      740,
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
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      740,
      1460,
      77,
      22.0
     ],
     "id": "obj-195"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      740,
      1490,
      100,
      22.0
     ],
     "id": "obj-196"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      860,
      1340,
      160,
      22.0
     ],
     "id": "obj-197"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      860,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-198"
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
      860,
      1430,
      72,
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
      860,
      1460,
      40,
      22.0
     ],
     "id": "obj-200"
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
      936,
      1430,
      72,
      22.0
     ],
     "id": "obj-201"
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
      936,
      1460,
      40,
      22.0
     ],
     "id": "obj-202"
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
      1012,
      1430,
      72,
      22.0
     ],
     "id": "obj-203"
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
      1012,
      1460,
      40,
      22.0
     ],
     "id": "obj-204"
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
      1088,
      1430,
      72,
      22.0
     ],
     "id": "obj-205"
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
      1088,
      1460,
      40,
      22.0
     ],
     "id": "obj-206"
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
      1164,
      1430,
      72,
      22.0
     ],
     "id": "obj-207"
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
      1164,
      1460,
      40,
      22.0
     ],
     "id": "obj-208"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      860,
      1500,
      40,
      22.0
     ],
     "id": "obj-209"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      860,
      1560,
      80,
      22.0
     ],
     "id": "obj-210"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      960,
      1530,
      42,
      22.0
     ],
     "id": "obj-211"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1020,
      1500,
      100,
      22.0
     ],
     "id": "obj-212"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1020,
      1530,
      160,
      22.0
     ],
     "id": "obj-213"
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
      1060,
      1560,
      98,
      22.0
     ],
     "id": "obj-214"
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
      1600,
      49,
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
      920,
      1600,
      49,
      22.0
     ],
     "id": "obj-216"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      1160,
      1430,
      49,
      22.0
     ],
     "id": "obj-217"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1160,
      1460,
      77,
      22.0
     ],
     "id": "obj-218"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 2",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1160,
      1490,
      100,
      22.0
     ],
     "id": "obj-219"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      1280,
      1340,
      160,
      22.0
     ],
     "id": "obj-220"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      1280,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-221"
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
      1280,
      1430,
      72,
      22.0
     ],
     "id": "obj-222"
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
      1280,
      1460,
      40,
      22.0
     ],
     "id": "obj-223"
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
      1356,
      1430,
      72,
      22.0
     ],
     "id": "obj-224"
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
      1356,
      1460,
      40,
      22.0
     ],
     "id": "obj-225"
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
      1432,
      1430,
      72,
      22.0
     ],
     "id": "obj-226"
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
      1432,
      1460,
      40,
      22.0
     ],
     "id": "obj-227"
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
      1508,
      1430,
      72,
      22.0
     ],
     "id": "obj-228"
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
      1508,
      1460,
      40,
      22.0
     ],
     "id": "obj-229"
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
      1584,
      1430,
      72,
      22.0
     ],
     "id": "obj-230"
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
      1584,
      1460,
      40,
      22.0
     ],
     "id": "obj-231"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1280,
      1500,
      40,
      22.0
     ],
     "id": "obj-232"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      1280,
      1560,
      80,
      22.0
     ],
     "id": "obj-233"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1380,
      1530,
      42,
      22.0
     ],
     "id": "obj-234"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1440,
      1500,
      100,
      22.0
     ],
     "id": "obj-235"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1440,
      1530,
      160,
      22.0
     ],
     "id": "obj-236"
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
      1480,
      1560,
      98,
      22.0
     ],
     "id": "obj-237"
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
      1280,
      1600,
      49,
      22.0
     ],
     "id": "obj-238"
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
      1340,
      1600,
      49,
      22.0
     ],
     "id": "obj-239"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      1580,
      1430,
      49,
      22.0
     ],
     "id": "obj-240"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      1580,
      1460,
      77,
      22.0
     ],
     "id": "obj-241"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 3",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1580,
      1490,
      100,
      22.0
     ],
     "id": "obj-242"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      1700,
      1340,
      160,
      22.0
     ],
     "id": "obj-243"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      1700,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-244"
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
      1700,
      1430,
      72,
      22.0
     ],
     "id": "obj-245"
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
      1700,
      1460,
      40,
      22.0
     ],
     "id": "obj-246"
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
      1776,
      1430,
      72,
      22.0
     ],
     "id": "obj-247"
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
      1776,
      1460,
      40,
      22.0
     ],
     "id": "obj-248"
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
      1852,
      1430,
      72,
      22.0
     ],
     "id": "obj-249"
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
      1852,
      1460,
      40,
      22.0
     ],
     "id": "obj-250"
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
      1928,
      1430,
      72,
      22.0
     ],
     "id": "obj-251"
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
      1928,
      1460,
      40,
      22.0
     ],
     "id": "obj-252"
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
      2004,
      1430,
      72,
      22.0
     ],
     "id": "obj-253"
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
      2004,
      1460,
      40,
      22.0
     ],
     "id": "obj-254"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1700,
      1500,
      40,
      22.0
     ],
     "id": "obj-255"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      1700,
      1560,
      80,
      22.0
     ],
     "id": "obj-256"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      1800,
      1530,
      42,
      22.0
     ],
     "id": "obj-257"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1860,
      1500,
      100,
      22.0
     ],
     "id": "obj-258"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1860,
      1530,
      160,
      22.0
     ],
     "id": "obj-259"
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
      1900,
      1560,
      98,
      22.0
     ],
     "id": "obj-260"
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
      1700,
      1600,
      49,
      22.0
     ],
     "id": "obj-261"
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
      1760,
      1600,
      49,
      22.0
     ],
     "id": "obj-262"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      2000,
      1430,
      49,
      22.0
     ],
     "id": "obj-263"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      2000,
      1460,
      77,
      22.0
     ],
     "id": "obj-264"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 4",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      1490,
      100,
      22.0
     ],
     "id": "obj-265"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      2120,
      1340,
      160,
      22.0
     ],
     "id": "obj-266"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      2120,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-267"
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
      2120,
      1430,
      72,
      22.0
     ],
     "id": "obj-268"
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
      2120,
      1460,
      40,
      22.0
     ],
     "id": "obj-269"
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
      2196,
      1430,
      72,
      22.0
     ],
     "id": "obj-270"
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
      2196,
      1460,
      40,
      22.0
     ],
     "id": "obj-271"
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
      2272,
      1430,
      72,
      22.0
     ],
     "id": "obj-272"
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
      2272,
      1460,
      40,
      22.0
     ],
     "id": "obj-273"
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
      2348,
      1430,
      72,
      22.0
     ],
     "id": "obj-274"
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
      2348,
      1460,
      40,
      22.0
     ],
     "id": "obj-275"
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
      2424,
      1430,
      72,
      22.0
     ],
     "id": "obj-276"
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
      2424,
      1460,
      40,
      22.0
     ],
     "id": "obj-277"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      2120,
      1500,
      40,
      22.0
     ],
     "id": "obj-278"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      2120,
      1560,
      80,
      22.0
     ],
     "id": "obj-279"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      2220,
      1530,
      42,
      22.0
     ],
     "id": "obj-280"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2280,
      1500,
      100,
      22.0
     ],
     "id": "obj-281"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2280,
      1530,
      160,
      22.0
     ],
     "id": "obj-282"
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
      2320,
      1560,
      98,
      22.0
     ],
     "id": "obj-283"
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
      2120,
      1600,
      49,
      22.0
     ],
     "id": "obj-284"
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
      2180,
      1600,
      49,
      22.0
     ],
     "id": "obj-285"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      2420,
      1430,
      49,
      22.0
     ],
     "id": "obj-286"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      2420,
      1460,
      77,
      22.0
     ],
     "id": "obj-287"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 5",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2420,
      1490,
      100,
      22.0
     ],
     "id": "obj-288"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      2540,
      1340,
      160,
      22.0
     ],
     "id": "obj-289"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      2540,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-290"
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
      2540,
      1430,
      72,
      22.0
     ],
     "id": "obj-291"
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
      2540,
      1460,
      40,
      22.0
     ],
     "id": "obj-292"
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
      2616,
      1430,
      72,
      22.0
     ],
     "id": "obj-293"
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
      2616,
      1460,
      40,
      22.0
     ],
     "id": "obj-294"
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
      2692,
      1430,
      72,
      22.0
     ],
     "id": "obj-295"
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
      2692,
      1460,
      40,
      22.0
     ],
     "id": "obj-296"
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
      2768,
      1430,
      72,
      22.0
     ],
     "id": "obj-297"
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
      2768,
      1460,
      40,
      22.0
     ],
     "id": "obj-298"
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
      2844,
      1430,
      72,
      22.0
     ],
     "id": "obj-299"
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
      2844,
      1460,
      40,
      22.0
     ],
     "id": "obj-300"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      2540,
      1500,
      40,
      22.0
     ],
     "id": "obj-301"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      2540,
      1560,
      80,
      22.0
     ],
     "id": "obj-302"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      2640,
      1530,
      42,
      22.0
     ],
     "id": "obj-303"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2700,
      1500,
      100,
      22.0
     ],
     "id": "obj-304"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2700,
      1530,
      160,
      22.0
     ],
     "id": "obj-305"
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
      2740,
      1560,
      98,
      22.0
     ],
     "id": "obj-306"
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
      2540,
      1600,
      49,
      22.0
     ],
     "id": "obj-307"
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
      2600,
      1600,
      49,
      22.0
     ],
     "id": "obj-308"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      2840,
      1430,
      49,
      22.0
     ],
     "id": "obj-309"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      2840,
      1460,
      77,
      22.0
     ],
     "id": "obj-310"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 6",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2840,
      1490,
      100,
      22.0
     ],
     "id": "obj-311"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route g t r c pn",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      2960,
      1340,
      160,
      22.0
     ],
     "id": "obj-312"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 1,
     "numoutlets": 12,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      2960,
      1380,
      380,
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
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       800.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          42,
          22.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "codebox",
         "code": "// VoChop voice (gen~ codebox). Positions are in ms of the source buffer.\n// The buffer itself is read by play~ objects outside (they handle the ---name);\n// this computes 5 read heads (1 direct + 4 cloud grains) with their gains.\n// Modes: 0 one-shot, 1 loop, 2 cloud (word start, then a granular sustain on the vowel), 3 repeat\nParam trig(0);\nParam kill(0);\nParam s0(0);\nParam s1(0);\nParam cs0(0);\nParam cs1(0);\nParam spd(1);\nParam mode(0);\nParam rev(0);\nParam amp(0);\nParam att(2);\nParam rel(200);\nParam hold(0);\nParam gsz(120);\nParam rlen(100);\nParam fade(4);\n\nHistory ltrig(0);\nHistory lkill(0);\nHistory pos(0);\nHistory env(0);\nHistory active(0);\nHistory killing(0);\nHistory stage(0);\nHistory xf(0);\nHistory g1p(0);\nHistory g1s(0);\nHistory g2p(0.25);\nHistory g2s(0);\nHistory g3p(0.5);\nHistory g3s(0);\nHistory g4p(0.75);\nHistory g4s(0);\nHistory ldone(0);\n\ndummy = in1;\nmsps = 1000 / samplerate;\ndone = 0;\nw0 = 0;\nw1 = 0;\nw2 = 0;\nw3 = 0;\nw4 = 0;\new = 0;\nlo = 0;\nhi = 0;\ng = max(20, gsz);\nregion = 0;\ninc = 0;\nspan = 0;\n\n// kill first: a new trigger in the same block wins (choke + retrigger on one voice)\nif (kill != lkill) {\n\tlkill = kill;\n\tkilling = 1;\n}\nif (trig != ltrig) {\n\tltrig = trig;\n\tactive = 1;\n\tkilling = 0;\n\tstage = 0;\n\txf = 0;\n\tpos = s0;\n\tif (rev > 0.5) {\n\t\tpos = s1;\n\t\tif (mode > 2.5) {\n\t\t\tpos = min(s1, s0 + max(5, rlen));\n\t\t}\n\t}\n\tg1p = 0;\n\tg2p = 0.25;\n\tg3p = 0.5;\n\tg4p = 0.75;\n\tg1s = cs0;\n\tg2s = cs0;\n\tg3s = cs0;\n\tg4s = cs0;\n}\n\n// amplitude envelope (attack / release in ms, kill = 5 ms fade)\ntgt = 0;\nif (active > 0.5 && hold > 0.5 && killing < 0.5) {\n\ttgt = 1;\n}\nup = msps / max(0.05, att);\ndn = msps / max(0.05, rel);\nif (killing > 0.5) {\n\tdn = msps / 5;\n}\nif (env < tgt) {\n\tenv = min(tgt, env + up);\n} else if (env > tgt) {\n\tenv = max(tgt, env - dn);\n}\n\nstp = spd * msps;\nfd = max(0.5, fade);\n\nif (active > 0.5) {\n\tif (mode < 0.5) {\n\t\t// one-shot (forward or reverse)\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (pos > s1 || pos < s0) {\n\t\t\tactive = 0;\n\t\t\tdone = 1;\n\t\t}\n\t} else if (mode < 1.5 || mode > 2.5) {\n\t\t// loop the slice, or repeat its first rlen ms\n\t\tlo = s0;\n\t\thi = s1;\n\t\tif (mode > 2.5) {\n\t\t\thi = min(s1, s0 + max(5, rlen));\n\t\t}\n\t\tew = min(1, min((pos - lo) / fd, (hi - pos) / fd));\n\t\tw0 = max(0, ew);\n\t\tif (rev > 0.5) {\n\t\t\tpos = pos - stp;\n\t\t\tif (pos < lo) {\n\t\t\t\tpos = hi - (lo - pos);\n\t\t\t}\n\t\t} else {\n\t\t\tpos = pos + stp;\n\t\t\tif (pos > hi) {\n\t\t\t\tpos = lo + (pos - hi);\n\t\t\t}\n\t\t}\n\t} else {\n\t\t// cloud: play the word from its start, then cross into grains on the vowel\n\t\tew = min(1, min((pos - s0) / fd, (s1 - pos) / fd));\n\t\tw0 = max(0, ew) * (1 - xf);\n\t\tif (pos < s1) {\n\t\t\tpos = pos + stp;\n\t\t}\n\t\tif (stage < 0.5 && pos >= cs1 - 40 * spd) {\n\t\t\tstage = 1;\n\t\t}\n\t\tif (stage > 0.5) {\n\t\t\txf = min(1, xf + msps / 60);\n\t\t\tregion = max(0, cs1 - cs0);\n\t\t\tg = min(max(20, gsz), max(20, region / max(0.25, spd)));\n\t\t\tinc = msps / g;\n\t\t\tspan = max(0, region - g * spd);\n\t\t\tg1p = g1p + inc;\n\t\t\tif (g1p >= 1) {\n\t\t\t\tg1p = g1p - 1;\n\t\t\t\tg1s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg2p = g2p + inc;\n\t\t\tif (g2p >= 1) {\n\t\t\t\tg2p = g2p - 1;\n\t\t\t\tg2s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg3p = g3p + inc;\n\t\t\tif (g3p >= 1) {\n\t\t\t\tg3p = g3p - 1;\n\t\t\t\tg3s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\tg4p = g4p + inc;\n\t\t\tif (g4p >= 1) {\n\t\t\t\tg4p = g4p - 1;\n\t\t\t\tg4s = cs0 + (noise() * 0.5 + 0.5) * span;\n\t\t\t}\n\t\t\t// Hann windows at 4x overlap sum to 2\n\t\t\tw1 = (0.5 - 0.5 * cos(6.283185307 * g1p)) * 0.5 * xf;\n\t\t\tw2 = (0.5 - 0.5 * cos(6.283185307 * g2p)) * 0.5 * xf;\n\t\t\tw3 = (0.5 - 0.5 * cos(6.283185307 * g3p)) * 0.5 * xf;\n\t\t\tw4 = (0.5 - 0.5 * cos(6.283185307 * g4p)) * 0.5 * xf;\n\t\t}\n\t}\n\tif (tgt < 0.5 && env <= 0) {\n\t\tactive = 0;\n\t\tdone = 1;\n\t}\n}\n\nga = env * amp;\nout1 = pos;\nout2 = w0 * ga;\nout3 = g1s + g1p * g * spd;\nout4 = w1 * ga;\nout5 = g2s + g2p * g * spd;\nout6 = w2 * ga;\nout7 = g3s + g3p * g * spd;\nout8 = w3 * ga;\nout9 = g4s + g4p * g * spd;\nout10 = w4 * ga;\nif (done > 0.5) {\n\tldone = trig;\n}\nout11 = done;\nout12 = ldone;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 12,
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
          ""
         ],
         "patching_rect": [
          20,
          60,
          700,
          600
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20,
          700,
          49,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          80,
          700,
          49,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140,
          700,
          49,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          200,
          700,
          49,
          22.0
         ],
         "id": "obj-6"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260,
          700,
          49,
          22.0
         ],
         "id": "obj-7"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          320,
          700,
          49,
          22.0
         ],
         "id": "obj-8"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380,
          700,
          49,
          22.0
         ],
         "id": "obj-9"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          440,
          700,
          49,
          22.0
         ],
         "id": "obj-10"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 9",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          500,
          700,
          49,
          22.0
         ],
         "id": "obj-11"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 10",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          560,
          700,
          56,
          22.0
         ],
         "id": "obj-12"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 11",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          620,
          700,
          56,
          22.0
         ],
         "id": "obj-13"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 12",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          680,
          700,
          56,
          22.0
         ],
         "id": "obj-14"
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
          "obj-2",
          1
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
          "obj-2",
          2
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
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          4
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
          "obj-2",
          5
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
          "obj-2",
          6
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          7
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
          "obj-2",
          8
         ],
         "destination": [
          "obj-11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          9
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
          "obj-2",
          10
         ],
         "destination": [
          "obj-13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          11
         ],
         "destination": [
          "obj-14",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-313"
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
      2960,
      1430,
      72,
      22.0
     ],
     "id": "obj-314"
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
      2960,
      1460,
      40,
      22.0
     ],
     "id": "obj-315"
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
      3036,
      1430,
      72,
      22.0
     ],
     "id": "obj-316"
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
      3036,
      1460,
      40,
      22.0
     ],
     "id": "obj-317"
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
      3112,
      1430,
      72,
      22.0
     ],
     "id": "obj-318"
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
      3112,
      1460,
      40,
      22.0
     ],
     "id": "obj-319"
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
      3188,
      1430,
      72,
      22.0
     ],
     "id": "obj-320"
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
      3188,
      1460,
      40,
      22.0
     ],
     "id": "obj-321"
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
      3264,
      1430,
      72,
      22.0
     ],
     "id": "obj-322"
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
      3264,
      1460,
      40,
      22.0
     ],
     "id": "obj-323"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "+~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      2960,
      1500,
      40,
      22.0
     ],
     "id": "obj-324"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "retune~",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      ""
     ],
     "patching_rect": [
      2960,
      1560,
      80,
      22.0
     ],
     "id": "obj-325"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sig~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      3060,
      1530,
      42,
      22.0
     ],
     "id": "obj-326"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend retune",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3120,
      1500,
      100,
      22.0
     ],
     "id": "obj-327"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend correction_amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3120,
      1530,
      160,
      22.0
     ],
     "id": "obj-328"
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
      3160,
      1560,
      98,
      22.0
     ],
     "id": "obj-329"
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
      2960,
      1600,
      49,
      22.0
     ],
     "id": "obj-330"
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
      3020,
      1600,
      49,
      22.0
     ],
     "id": "obj-331"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      3260,
      1430,
      49,
      22.0
     ],
     "id": "obj-332"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      3260,
      1460,
      77,
      22.0
     ],
     "id": "obj-333"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend vend 7",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      3260,
      1490,
      100,
      22.0
     ],
     "id": "obj-334"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1500,
      1300,
      40,
      22.0
     ],
     "id": "obj-335"
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
      2000,
      420,
      22.0
     ],
     "id": "obj-336"
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
      2040,
      49,
      22.0
     ],
     "id": "obj-337"
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
      2080,
      100,
      22.0
     ],
     "id": "obj-338"
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
      2120,
      100,
      22.0
     ],
     "id": "obj-339"
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
      2160,
      100,
      22.0
     ],
     "id": "obj-340"
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
      2200,
      56,
      22.0
     ],
     "id": "obj-341"
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
      2230,
      49,
      22.0
     ],
     "id": "obj-342"
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
      2260,
      70,
      22.0
     ],
     "id": "obj-343"
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
      2080,
      100,
      22.0
     ],
     "id": "obj-344"
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
      2120,
      100,
      22.0
     ],
     "id": "obj-345"
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
      2160,
      100,
      22.0
     ],
     "id": "obj-346"
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
      2200,
      56,
      22.0
     ],
     "id": "obj-347"
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
      2230,
      49,
      22.0
     ],
     "id": "obj-348"
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
      2260,
      70,
      22.0
     ],
     "id": "obj-349"
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
      2300,
      49,
      22.0
     ],
     "id": "obj-350"
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
      2340,
      90,
      22.0
     ],
     "id": "obj-351"
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
      2370,
      90,
      22.0
     ],
     "id": "obj-352"
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
      2400,
      90,
      22.0
     ],
     "id": "obj-353"
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
      2430,
      90,
      22.0
     ],
     "id": "obj-354"
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
      2460,
      90,
      22.0
     ],
     "id": "obj-355"
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
      2490,
      56,
      22.0
     ],
     "id": "obj-356"
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
      2520,
      49,
      22.0
     ],
     "id": "obj-357"
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
      2300,
      56,
      22.0
     ],
     "id": "obj-358"
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
      2400,
      90,
      22.0
     ],
     "id": "obj-359"
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
      2340,
      125,
      22.0
     ],
     "id": "obj-360"
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
      2340,
      125,
      22.0
     ],
     "id": "obj-361"
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
      2340,
      125,
      22.0
     ],
     "id": "obj-362"
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
      2340,
      125,
      22.0
     ],
     "id": "obj-363"
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
      2440,
      110,
      22.0
     ],
     "id": "obj-364"
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
      2470,
      110,
      22.0
     ],
     "id": "obj-365"
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
      2500,
      49,
      22.0
     ],
     "id": "obj-366"
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
      2440,
      110,
      22.0
     ],
     "id": "obj-367"
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
      2470,
      110,
      22.0
     ],
     "id": "obj-368"
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
      2500,
      49,
      22.0
     ],
     "id": "obj-369"
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
      2560,
      90,
      22.0
     ],
     "id": "obj-370"
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
      2560,
      90,
      22.0
     ],
     "id": "obj-371"
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
      2600,
      40,
      136
     ],
     "presentation": 1,
     "presentation_rect": [
      1084,
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
     "id": "obj-372"
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
      2760,
      70,
      22.0
     ],
     "id": "obj-373"
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
      5
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
      4
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
      "obj-18",
      9
     ],
     "destination": [
      "obj-25",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-25",
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
      "obj-26",
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
      "obj-27",
      2
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
      "obj-27",
      3
     ],
     "destination": [
      "obj-28",
      1
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
      "obj-29",
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
      "obj-31",
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
      "obj-32",
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
      "obj-33",
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
      "obj-5",
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
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
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
      "obj-34",
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
      "obj-35",
      0
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
      "obj-36",
      0
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
      "obj-30",
      0
     ],
     "destination": [
      "obj-37",
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
      "obj-38",
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
      "obj-5",
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
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      7
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
      "obj-41",
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
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      8
     ],
     "destination": [
      "obj-42",
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
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-47",
      0
     ],
     "destination": [
      "obj-45",
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
      "obj-49",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-49",
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
      "obj-5",
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
      "obj-53",
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
      "obj-39",
      1
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
      "obj-59",
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
      "obj-60",
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
      "obj-63",
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
      "obj-64",
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
      "obj-67",
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
      "obj-70",
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
      "obj-16",
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
      "obj-74",
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
      "obj-75",
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
      "obj-73",
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
      "obj-111",
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
      "obj-30",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      10
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
      "obj-102",
      0
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
      "obj-114",
      0
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
      "obj-110",
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
      "obj-115",
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
      "obj-116",
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
      "obj-118",
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
      "obj-119",
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
      "obj-5",
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
      "obj-78",
      0
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
      "obj-5",
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
      "obj-122",
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
      "obj-5",
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
      "obj-5",
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
      "obj-5",
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
      "obj-125",
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
      "obj-5",
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
      "obj-5",
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
      "obj-127",
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
      "obj-5",
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
      "obj-128",
      0
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
      "obj-5",
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
      "obj-129",
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
      "obj-5",
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
      "obj-130",
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
      "obj-5",
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
      "obj-5",
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
      "obj-132",
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
      "obj-5",
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
      "obj-133",
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
      "obj-5",
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
      "obj-92",
      0
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
      "obj-5",
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
      "obj-136",
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
      "obj-5",
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
      "obj-5",
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
      "obj-5",
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
      "obj-139",
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
      "obj-5",
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
      "obj-5",
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
      "obj-141",
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
      "obj-5",
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
      "obj-142",
      0
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
      "obj-5",
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
      "obj-143",
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
      "obj-5",
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
      "obj-144",
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
      "obj-5",
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
      "obj-5",
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
      "obj-146",
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
      "obj-5",
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
      "obj-147",
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
      "obj-72",
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
      "obj-77",
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
      "obj-78",
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
      "obj-79",
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
      "obj-80",
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
      "obj-81",
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
      "obj-82",
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
      "obj-83",
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
      "obj-84",
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
      "obj-85",
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
      "obj-86",
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
      "obj-87",
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
      "obj-88",
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
      "obj-89",
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
      "obj-90",
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
      "obj-91",
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
      "obj-92",
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
      "obj-93",
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
      "obj-94",
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
      "obj-95",
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
      "obj-96",
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
      "obj-97",
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
      "obj-100",
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
      "obj-102",
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
      "obj-104",
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
      "obj-106",
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
      "obj-110",
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
      "obj-108",
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
      "obj-153",
      0
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
      "obj-152",
      1
     ],
     "destination": [
      "obj-154",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-152",
      2
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
      "obj-155",
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
      "obj-152",
      3
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
      "obj-152",
      4
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
      "obj-157",
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
      "obj-152",
      5
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
      "obj-152",
      6
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
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-152",
      7
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
      "obj-152",
      8
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
      "obj-161",
      0
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
      "obj-152",
      9
     ],
     "destination": [
      "obj-162",
      1
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
      "obj-163",
      0
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
      "obj-163",
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
      "obj-163",
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
      "obj-163",
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
      "obj-151",
      1
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
      "obj-164",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      2
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
      "obj-164",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      3
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
      "obj-167",
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
      "obj-151",
      4
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
      "obj-164",
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
      "obj-170",
      1
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
      "obj-149",
      0
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
      "obj-150",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-152",
      10
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
      "obj-152",
      11
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
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      1
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
      "obj-174",
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
      "obj-175",
      0
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
      "obj-177",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      1
     ],
     "destination": [
      "obj-177",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      2
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
      "obj-175",
      3
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
      "obj-175",
      4
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
      "obj-175",
      5
     ],
     "destination": [
      "obj-181",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      6
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
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      7
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
      "obj-175",
      8
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
      "obj-184",
      0
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
      "obj-175",
      9
     ],
     "destination": [
      "obj-185",
      1
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
      "obj-186",
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
      "obj-186",
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
      "obj-186",
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
      "obj-187",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      1
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
      "obj-188",
      0
     ],
     "destination": [
      "obj-187",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      2
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
      "obj-189",
      0
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
      "obj-174",
      3
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
      "obj-187",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      4
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
      "obj-187",
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
      "obj-187",
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
      "obj-191",
      0
     ],
     "destination": [
      "obj-192",
      1
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
      "obj-192",
      0
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
      "obj-193",
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
      "obj-175",
      10
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
      "obj-175",
      11
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
      "obj-195",
      0
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
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      2
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
      "obj-197",
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
      "obj-198",
      0
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
      "obj-199",
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
      "obj-198",
      1
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
      "obj-198",
      2
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
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-198",
      3
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
      "obj-198",
      4
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
      "obj-203",
      0
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
      "obj-198",
      5
     ],
     "destination": [
      "obj-204",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-198",
      6
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
      "obj-198",
      7
     ],
     "destination": [
      "obj-206",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-198",
      8
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
      "obj-198",
      9
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
      "obj-200",
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
      "obj-202",
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
      "obj-204",
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
      "obj-209",
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
      "obj-209",
      0
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
      "obj-197",
      1
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
      "obj-211",
      0
     ],
     "destination": [
      "obj-210",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-197",
      2
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
      "obj-212",
      0
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
      "obj-197",
      3
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
      "obj-213",
      0
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
      "obj-197",
      4
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
      "obj-210",
      0
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
      "obj-210",
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
      "obj-215",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-214",
      1
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
      0
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
      "obj-216",
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
      "obj-198",
      10
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
      "obj-198",
      11
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
      "obj-217",
      0
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
      "obj-219",
      0
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
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      3
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
      "obj-220",
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
      "obj-221",
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
      "obj-221",
      1
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
      "obj-221",
      2
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
      "obj-221",
      3
     ],
     "destination": [
      "obj-225",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-221",
      4
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
      "obj-226",
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
      "obj-221",
      5
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
      "obj-221",
      6
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
      "obj-221",
      7
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
      "obj-221",
      8
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
      "obj-221",
      9
     ],
     "destination": [
      "obj-231",
      1
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
      "obj-232",
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
      "obj-232",
      0
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
      "obj-232",
      0
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
      "obj-232",
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
      "obj-220",
      1
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
      "obj-233",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      2
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
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      3
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
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      4
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
      "obj-233",
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
      "obj-233",
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
      "obj-237",
      0
     ],
     "destination": [
      "obj-238",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-237",
      1
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
      "obj-238",
      0
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
      "obj-239",
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
      "obj-221",
      10
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
      "obj-221",
      11
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
      "obj-240",
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
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      4
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
      "obj-243",
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
      "obj-244",
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
      "obj-245",
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
      "obj-244",
      1
     ],
     "destination": [
      "obj-246",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-244",
      2
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
      "obj-244",
      3
     ],
     "destination": [
      "obj-248",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-244",
      4
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
      "obj-249",
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
      "obj-244",
      5
     ],
     "destination": [
      "obj-250",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-244",
      6
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
      "obj-244",
      7
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
      "obj-244",
      8
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
      "obj-253",
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
      "obj-244",
      9
     ],
     "destination": [
      "obj-254",
      1
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
      "obj-255",
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
      "obj-255",
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
      "obj-255",
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
      0
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
      "obj-243",
      1
     ],
     "destination": [
      "obj-257",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-257",
      0
     ],
     "destination": [
      "obj-256",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-243",
      2
     ],
     "destination": [
      "obj-258",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-258",
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
      "obj-243",
      3
     ],
     "destination": [
      "obj-259",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-259",
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
      "obj-243",
      4
     ],
     "destination": [
      "obj-260",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-256",
      0
     ],
     "destination": [
      "obj-261",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-256",
      0
     ],
     "destination": [
      "obj-262",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-260",
      0
     ],
     "destination": [
      "obj-261",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-260",
      1
     ],
     "destination": [
      "obj-262",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-261",
      0
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
      "obj-262",
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
      "obj-244",
      10
     ],
     "destination": [
      "obj-263",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-244",
      11
     ],
     "destination": [
      "obj-264",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-263",
      0
     ],
     "destination": [
      "obj-264",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-264",
      0
     ],
     "destination": [
      "obj-265",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-265",
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
      "obj-148",
      5
     ],
     "destination": [
      "obj-266",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-266",
      0
     ],
     "destination": [
      "obj-267",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      0
     ],
     "destination": [
      "obj-268",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-268",
      0
     ],
     "destination": [
      "obj-269",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      1
     ],
     "destination": [
      "obj-269",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      2
     ],
     "destination": [
      "obj-270",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-270",
      0
     ],
     "destination": [
      "obj-271",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      3
     ],
     "destination": [
      "obj-271",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      4
     ],
     "destination": [
      "obj-272",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-272",
      0
     ],
     "destination": [
      "obj-273",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      5
     ],
     "destination": [
      "obj-273",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      6
     ],
     "destination": [
      "obj-274",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-274",
      0
     ],
     "destination": [
      "obj-275",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      7
     ],
     "destination": [
      "obj-275",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      8
     ],
     "destination": [
      "obj-276",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-276",
      0
     ],
     "destination": [
      "obj-277",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      9
     ],
     "destination": [
      "obj-277",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-269",
      0
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-271",
      0
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-273",
      0
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-275",
      0
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-277",
      0
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-278",
      0
     ],
     "destination": [
      "obj-279",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-266",
      1
     ],
     "destination": [
      "obj-280",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-280",
      0
     ],
     "destination": [
      "obj-279",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-266",
      2
     ],
     "destination": [
      "obj-281",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-281",
      0
     ],
     "destination": [
      "obj-279",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-266",
      3
     ],
     "destination": [
      "obj-282",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-282",
      0
     ],
     "destination": [
      "obj-279",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-266",
      4
     ],
     "destination": [
      "obj-283",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-279",
      0
     ],
     "destination": [
      "obj-284",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-279",
      0
     ],
     "destination": [
      "obj-285",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-283",
      0
     ],
     "destination": [
      "obj-284",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-283",
      1
     ],
     "destination": [
      "obj-285",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-284",
      0
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
      "obj-285",
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
      "obj-267",
      10
     ],
     "destination": [
      "obj-286",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      11
     ],
     "destination": [
      "obj-287",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-286",
      0
     ],
     "destination": [
      "obj-287",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-287",
      0
     ],
     "destination": [
      "obj-288",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-288",
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
      "obj-148",
      6
     ],
     "destination": [
      "obj-289",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      0
     ],
     "destination": [
      "obj-290",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      0
     ],
     "destination": [
      "obj-291",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-291",
      0
     ],
     "destination": [
      "obj-292",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      1
     ],
     "destination": [
      "obj-292",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      2
     ],
     "destination": [
      "obj-293",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-293",
      0
     ],
     "destination": [
      "obj-294",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      3
     ],
     "destination": [
      "obj-294",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      4
     ],
     "destination": [
      "obj-295",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-295",
      0
     ],
     "destination": [
      "obj-296",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      5
     ],
     "destination": [
      "obj-296",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      6
     ],
     "destination": [
      "obj-297",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-298",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      7
     ],
     "destination": [
      "obj-298",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      8
     ],
     "destination": [
      "obj-299",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-299",
      0
     ],
     "destination": [
      "obj-300",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      9
     ],
     "destination": [
      "obj-300",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-292",
      0
     ],
     "destination": [
      "obj-301",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-294",
      0
     ],
     "destination": [
      "obj-301",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-296",
      0
     ],
     "destination": [
      "obj-301",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-298",
      0
     ],
     "destination": [
      "obj-301",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-300",
      0
     ],
     "destination": [
      "obj-301",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-301",
      0
     ],
     "destination": [
      "obj-302",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      1
     ],
     "destination": [
      "obj-303",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-303",
      0
     ],
     "destination": [
      "obj-302",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      2
     ],
     "destination": [
      "obj-304",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-304",
      0
     ],
     "destination": [
      "obj-302",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      3
     ],
     "destination": [
      "obj-305",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-305",
      0
     ],
     "destination": [
      "obj-302",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      4
     ],
     "destination": [
      "obj-306",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-302",
      0
     ],
     "destination": [
      "obj-307",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-302",
      0
     ],
     "destination": [
      "obj-308",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-306",
      0
     ],
     "destination": [
      "obj-307",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-306",
      1
     ],
     "destination": [
      "obj-308",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-307",
      0
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
      "obj-308",
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
      "obj-290",
      10
     ],
     "destination": [
      "obj-309",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-290",
      11
     ],
     "destination": [
      "obj-310",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-309",
      0
     ],
     "destination": [
      "obj-310",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-310",
      0
     ],
     "destination": [
      "obj-311",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-311",
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
      "obj-148",
      7
     ],
     "destination": [
      "obj-312",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-312",
      0
     ],
     "destination": [
      "obj-313",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      0
     ],
     "destination": [
      "obj-314",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-314",
      0
     ],
     "destination": [
      "obj-315",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      1
     ],
     "destination": [
      "obj-315",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      2
     ],
     "destination": [
      "obj-316",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-316",
      0
     ],
     "destination": [
      "obj-317",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      3
     ],
     "destination": [
      "obj-317",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      4
     ],
     "destination": [
      "obj-318",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-318",
      0
     ],
     "destination": [
      "obj-319",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      5
     ],
     "destination": [
      "obj-319",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      6
     ],
     "destination": [
      "obj-320",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-320",
      0
     ],
     "destination": [
      "obj-321",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      7
     ],
     "destination": [
      "obj-321",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      8
     ],
     "destination": [
      "obj-322",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-322",
      0
     ],
     "destination": [
      "obj-323",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      9
     ],
     "destination": [
      "obj-323",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-315",
      0
     ],
     "destination": [
      "obj-324",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-317",
      0
     ],
     "destination": [
      "obj-324",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-319",
      0
     ],
     "destination": [
      "obj-324",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-321",
      0
     ],
     "destination": [
      "obj-324",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-323",
      0
     ],
     "destination": [
      "obj-324",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-324",
      0
     ],
     "destination": [
      "obj-325",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-312",
      1
     ],
     "destination": [
      "obj-326",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-326",
      0
     ],
     "destination": [
      "obj-325",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-312",
      2
     ],
     "destination": [
      "obj-327",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-327",
      0
     ],
     "destination": [
      "obj-325",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-312",
      3
     ],
     "destination": [
      "obj-328",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-328",
      0
     ],
     "destination": [
      "obj-325",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-312",
      4
     ],
     "destination": [
      "obj-329",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-325",
      0
     ],
     "destination": [
      "obj-330",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-325",
      0
     ],
     "destination": [
      "obj-331",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-329",
      0
     ],
     "destination": [
      "obj-330",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-329",
      1
     ],
     "destination": [
      "obj-331",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-330",
      0
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
      "obj-331",
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
      "obj-313",
      10
     ],
     "destination": [
      "obj-332",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-313",
      11
     ],
     "destination": [
      "obj-333",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-332",
      0
     ],
     "destination": [
      "obj-333",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-333",
      0
     ],
     "destination": [
      "obj-334",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-334",
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
      "obj-335",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-335",
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
      "obj-335",
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
      "obj-335",
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
      "obj-335",
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
      "obj-335",
      0
     ],
     "destination": [
      "obj-258",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-335",
      0
     ],
     "destination": [
      "obj-281",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-335",
      0
     ],
     "destination": [
      "obj-304",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-335",
      0
     ],
     "destination": [
      "obj-327",
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
      "obj-336",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      1
     ],
     "destination": [
      "obj-337",
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
      "obj-338",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-337",
      0
     ],
     "destination": [
      "obj-338",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      2
     ],
     "destination": [
      "obj-338",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      0
     ],
     "destination": [
      "obj-339",
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
      "obj-339",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-338",
      0
     ],
     "destination": [
      "obj-339",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-338",
      1
     ],
     "destination": [
      "obj-339",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-338",
      2
     ],
     "destination": [
      "obj-339",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-340",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      3
     ],
     "destination": [
      "obj-340",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      4
     ],
     "destination": [
      "obj-340",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-340",
      0
     ],
     "destination": [
      "obj-341",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      5
     ],
     "destination": [
      "obj-341",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-341",
      0
     ],
     "destination": [
      "obj-342",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-342",
      0
     ],
     "destination": [
      "obj-343",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      6
     ],
     "destination": [
      "obj-343",
      1
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
      "obj-344",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-337",
      0
     ],
     "destination": [
      "obj-344",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      2
     ],
     "destination": [
      "obj-344",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      0
     ],
     "destination": [
      "obj-345",
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
      "obj-345",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-344",
      0
     ],
     "destination": [
      "obj-345",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-344",
      1
     ],
     "destination": [
      "obj-345",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-344",
      2
     ],
     "destination": [
      "obj-345",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-345",
      0
     ],
     "destination": [
      "obj-346",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      3
     ],
     "destination": [
      "obj-346",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      4
     ],
     "destination": [
      "obj-346",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-346",
      0
     ],
     "destination": [
      "obj-347",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      5
     ],
     "destination": [
      "obj-347",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-347",
      0
     ],
     "destination": [
      "obj-348",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-348",
      0
     ],
     "destination": [
      "obj-349",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      6
     ],
     "destination": [
      "obj-349",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-343",
      0
     ],
     "destination": [
      "obj-350",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-349",
      0
     ],
     "destination": [
      "obj-350",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      7
     ],
     "destination": [
      "obj-350",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-350",
      0
     ],
     "destination": [
      "obj-351",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-351",
      0
     ],
     "destination": [
      "obj-352",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-352",
      0
     ],
     "destination": [
      "obj-353",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-353",
      0
     ],
     "destination": [
      "obj-354",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-354",
      0
     ],
     "destination": [
      "obj-355",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-355",
      0
     ],
     "destination": [
      "obj-356",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-356",
      0
     ],
     "destination": [
      "obj-357",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-357",
      0
     ],
     "destination": [
      "obj-351",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      8
     ],
     "destination": [
      "obj-352",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      8
     ],
     "destination": [
      "obj-354",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      9
     ],
     "destination": [
      "obj-356",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-343",
      0
     ],
     "destination": [
      "obj-358",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-349",
      0
     ],
     "destination": [
      "obj-358",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-352",
      0
     ],
     "destination": [
      "obj-358",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-354",
      0
     ],
     "destination": [
      "obj-358",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-358",
      0
     ],
     "destination": [
      "obj-360",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      11
     ],
     "destination": [
      "obj-360",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-360",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-358",
      0
     ],
     "destination": [
      "obj-361",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      11
     ],
     "destination": [
      "obj-361",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-361",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-358",
      0
     ],
     "destination": [
      "obj-362",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      11
     ],
     "destination": [
      "obj-362",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-362",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-358",
      0
     ],
     "destination": [
      "obj-363",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      11
     ],
     "destination": [
      "obj-363",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-363",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-359",
      0
     ],
     "destination": [
      "obj-364",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-364",
      0
     ],
     "destination": [
      "obj-365",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-365",
      0
     ],
     "destination": [
      "obj-366",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      10
     ],
     "destination": [
      "obj-366",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-359",
      0
     ],
     "destination": [
      "obj-367",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-367",
      0
     ],
     "destination": [
      "obj-368",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-368",
      0
     ],
     "destination": [
      "obj-369",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      10
     ],
     "destination": [
      "obj-369",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-343",
      0
     ],
     "destination": [
      "obj-370",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-352",
      0
     ],
     "destination": [
      "obj-370",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-366",
      0
     ],
     "destination": [
      "obj-370",
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
      "obj-370",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-349",
      0
     ],
     "destination": [
      "obj-371",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-354",
      0
     ],
     "destination": [
      "obj-371",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-369",
      0
     ],
     "destination": [
      "obj-371",
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
      "obj-371",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-370",
      0
     ],
     "destination": [
      "obj-372",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-371",
      0
     ],
     "destination": [
      "obj-372",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-372",
      0
     ],
     "destination": [
      "obj-373",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-372",
      1
     ],
     "destination": [
      "obj-373",
      1
     ]
    }
   }
  ],
  "openrect": [
   0.0,
   0.0,
   1128.0,
   169.0
  ]
 }
}