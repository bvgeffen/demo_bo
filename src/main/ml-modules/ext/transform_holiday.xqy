xquery version "1.0-ml";
module namespace holiday = "http://marklogic.com/holiday";
declare function holiday:transform(
  $content as map:map,
  $context as map:map
) as map:map*
{
  (: get the uri and the source data from the map:map :)
  let $uri := map:get($content, "uri")
  let $doc := map:get($content, "value")
  (: Create an envelope that holds metadata/enrichment and a raw section that holds the original source data :)
  let $new-doc := document {
    <envelope>
      <metadata>
        <created>{fn:current-dateTime()}</created>
        <date>{fn:string-join(($doc//Year, "-", $doc//Month, "-", $doc//Day))}</date>
      </metadata>
      <raw>
         {$doc}
      </raw>
    </envelope>
  }
  (: Create a new map:map in order to return both uri and document :)
  let $new-content := map:map()
  let $new-uri := map:put($new-content, "uri", $uri)
  let $new-value := map:put($new-content, "value", $new-doc)
  return $new-content
};