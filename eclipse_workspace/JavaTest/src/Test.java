public class Test
{
	public void done( )
	{
		Data data = new Data( 10 );
		new ReaderThread( data ).start( );
		new ReaderThread( data ).start( );
		new ReaderThread( data ).start( );
		new ReaderThread( data ).start( );
		new ReaderThread( data ).start( );
		new ReaderThread( data ).start( );
		new WriterThread( data, "abcdefghijklmnopqrstuvwxyz" ).start( );
		new WriterThread( data, "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ).start( );
	}
	
	/**
	 * @param args
	 */
	public static void main( String[] args )
	{
		new Test( ).done( );
	}
}
