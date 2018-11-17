# TernConverter.py
import sys
import json


def parseJSDocJson(hifiAPI):
    ternHifiJson = {}
    ternHifiJson['!name'] = 'HighFidelity'
    for entry in hifiAPI:
        kind = entry['kind']
        print(entry)
        if kind == 'namespace':
            apiName = entry['name']
            print(apiName)
            ternHifiJson[apiName] = {}
            if entry.get('properties'):
                for property in entry['properties']:
                    propertyName = property['name']
                    propertyType = property['type']['names'][0]
                    api = ternHifiJson[apiName]
                    api[propertyName] = propertyType
                    print(propertyName + ' ' + propertyType)

        if kind == 'function':
            apiName = entry['memberof']
            api = ternHifiJson[apiName]
            functionName = entry['name']

            params = ''
            if entry.get('params'):
                for param in entry['params']:
                    paramName = param['name']
                    paramType = param['type']['names'][0]
                    params += paramName + ': ' + paramType + ','

            if params.endswith(','):
                params = params[:-1]

            returns = 'void'
            if entry.get('returns'):
                returns = entry['returns'][0]['type']['names'][0]

            function = 'fn(' + params + ') -> [' + returns + ']'
            api[functionName] = function
        print('\n')
    return ternHifiJson


def main():
    argsLength = len(sys.argv)
    if argsLength == 3:
        inputFile = sys.argv[1]
        outFile = sys.argv[2]

        rawData = open(inputFile)
        jsonData = json.load(rawData)

        ternJson = parseJSDocJson(jsonData)

        # write out to file

        with open(outFile, 'w') as output:
            json.dump(ternJson, output)


main()
