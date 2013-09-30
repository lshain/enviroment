import java.util.Random;

public class WriterThread extends Thread
{
	private static int threadCount = 0;
	private Integer token;
	private static final Random random = new Random( );
	private final Data data;
	private final String filler;
	private int index = 0;
	
	public WriterThread( Data data, String filler )
	{
		this.data = data;
		this.filler = filler;
		threadCount++;
		token = new Integer( threadCount );
	}
	
	public void run( )
	{
		try
		{
			char c;
			while ( true )
			{
				c = nextChar( );
				data.write( token, c );
				System.out.println( Thread.currentThread( ).getName( ) + " write " + c );
				Thread.sleep( random.nextInt( 3000 ) );
			}
		}
		catch ( InterruptedException e )
		{
			System.out.println( "WriterThread...InterruptedException....." );
		}
	}
	
	private char nextChar( )
	{
		char c = filler.charAt( index );
		index = ( index + 1 ) % filler.length( );
		return c;
	}
}
