xquery version "1.0-ml";

module namespace t="http://marklogic.com/roxy/test";

import module "http://marklogic.com/roxy/test" at "/test/lib/test-helper.xqy";

declare option xdmp:mapping "false";

declare function t:test-1()
{
  t:assert-equal(<test/>, fn:doc("/test-delme.xml")/*)
};

declare function t:setup()
{
  xdmp:log("inserting doc"),
  xdmp:document-insert("/test-delme.xml", <test/>)
};

declare function t:teardown()
{
  xdmp:log("deleting doc"),
  xdmp:document-delete("/test-delme.xml")
};

