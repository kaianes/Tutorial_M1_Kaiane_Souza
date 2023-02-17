extends Node2D

var fruta1
var fruta2
var fruta3
var fruta4
var texto = ['banana','maçã','pera','abacaxi']
var texto2 = "essa é a frase do execício 3"
var numero
var lista = []

func _ready():
	pass
	
func _on_Button0_pressed():
	$Label0.text = "Sua lista é: "+ String(texto)	

func _on_Button_pressed():
	fruta1 = String($fruta1.text)
	fruta2 = String($fruta2.text)
	fruta3 = String($fruta3.text)
	fruta4 = String($fruta4.text)
	
	lista.append(fruta1)
	lista.append(fruta2)
	lista.append(fruta3)
	lista.append(fruta4)
	
	$ColorRect/lista.text = "Sua lista é: "+ String(lista)


func _on_Button2_pressed():
	$Label5.text = "Sua frase é: "+ String(texto2)


func _on_Button3_pressed():
	numero = String($numero.text)
	
	$ColorRect2/RichTextLabel.text = "Seu número é: "+ String(numero)
