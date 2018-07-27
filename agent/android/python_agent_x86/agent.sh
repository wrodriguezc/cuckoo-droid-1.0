export PYTHONHOME=/data/local/python_agent/python
export PYTHONPATH=/data/local/python_agent/python/extras/python:/data/local/python_agent/python/lib/python2.7/lib-dynload:/data/local/python_agent/python/lib/python2.7
export PATH=$PYTHONHOME/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/local/python_agent/python/lib:/data/local/python_agent/python/lib/python2.7/lib-dynload
cd /data/local/python_agent
/data/local/python_agent/python/bin/python /data/local/python_agent/agent.py
