extends Node

@onready var midi_player: MidiPlayer = $MidiPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
var audio_stream_players : Array[AudioStreamPlayer]

func _ready():
	audio_stream_players.append(audio_stream_player)
	midi_player.link_audio_stream_player(audio_stream_players)
	midi_player.loop = true
	
	midi_player.note.connect(my_note_callback)
	midi_player.play()

func my_note_callback(event, track):
	if (event['subtype'] == MIDI_MESSAGE_NOTE_ON): # note on
		pass
	elif (event['subtype'] == MIDI_MESSAGE_NOTE_OFF): # note off
		pass
	print("[Track: " + str(track) + "] Note played: " + str(event['note']))
