import glob, json

for f in glob.glob("*.json"):
	levelfile = open(f)
	leveltext = levelfile.read()
	levelfile.close()
	leveljson = json.loads(leveltext)
	foreground = leveljson["Layers"][0]["Data"]

	sum = 0
	for o in foreground:
		if o["Id"] == "COIN":
			sum += o["W"] * o["H"]
	print(f + ":" + str(sum))
