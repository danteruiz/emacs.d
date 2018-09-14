# TernConverter.py
import os, json
def parseJSDocJson(JSDoc):
    
def main():
    argsLength = len(sys.argv)
    if argsLength == 3:
        inputFile = sys.argv[1]
        outputFile = sys.argv[2]

        rawData = open(inputFile)
        jsonData = json.load(rawData)

        ternJson = parseJSDocJson(jsonData)

        #write out to file

main()
