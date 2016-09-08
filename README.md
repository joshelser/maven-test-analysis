## extract-test-results.rb

Accepts at least one XML file generates by the Maven Surefire or Failsafe plugin ("testsuite") and generates CSV data
with the Java Class Name, the test method name, and the duration of the test method.

Recommended usage: `find my_maven_project/ -name 'TEST*.xml' | xargs ./extract-test-results.rb`

Copyright Josh Elser 2016
