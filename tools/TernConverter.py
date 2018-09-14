# TernConverter.py
import sys
import json


def parseJSDocJson(JSDoc):
    print JSDoc


def main():
    argsLength = len(sys.argv)
    if argsLength == 3:
        inputFile = sys.argv[1]
        outputFile = sys.argv[2]

        rawData = open(inputFile)
        jsonData = json.load(rawData)

        ternJson = parseJSDocJson(jsonData)

        # write out to file


main()
