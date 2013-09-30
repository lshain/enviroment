public class ReaderThread extends Thread
{
	private static int threadCount = 0;
	private Integer token;
	
	private final Data data;
	
	public ReaderThread( Data data )
	{
		this.data = data;
		threadCount++;
		token = new Integer( threadCount );
	}
	
	public void run( )
	{
		try
		{
			char[] readbuf;
			while ( true )
			{
				readbuf = data.read( token );
				System.out.println( Thread.currentThread( ).getName( ) + " reads " + String.valueOf( readbuf ) );
			}
		}
		catch ( InterruptedException e )
		{
			System.out.println( "ReaderThread...InterruptedException....." );
		}
	}
}
