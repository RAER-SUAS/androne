void startListenForTCP (){
    Thread TCPListenerThread = new Thread(new Runnable() {
        @Override
        public void run() {

            Boolean run = true;
            String serverMessage = null;
            InetAddress serverAddr = null;

            try {
				Socket clientSocket = new Socket("192.168.11.254", 5566);

			try
				{
				char[] buffer = new char[2048];
				int charsRead = 0;
				BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
				while ((charsRead = in.read(buffer)) != -1)
			{
        String message = new String(buffer).substring(0, charsRead);
        Log.e("In While", "msg :"+message);

    }
} 
				catch(UnknownHostException e) {
                    mHandler.post(new DisplayToast(context, "UnknownHostException"));

                } catch(IOException e) {
                    mHandler.post(new DisplayToast(context, "IOException"));
                } finally {
                    clientSocket.close();
                }

            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    });
    TCPListenerThread.start();
}