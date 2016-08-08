echo 'Starting one worker'
echo 'Run this script multiple times to start more workers'
nohup bundle exec rake resque:work QUEUE=* BACKGROUND=yes &
#nohup bundle exec rake resque:work QUEUE=* BACKGROUND=yes &
#nohup bundle exec rake resque:work QUEUE=* BACKGROUND=yes &
