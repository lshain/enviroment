import orz.lshain.mutithreadlib.LT_ReadWriteMutex;

public class Data
{
	private final char[] buffer;
	private final LT_ReadWriteMutex mutex = new LT_ReadWriteMutex( );
	
	public Data( int size )
	{
		buffer = new char[size];
		for ( int i = 0; i < buffer.length; i++ )
		{
			buffer[i] = '*';
		}
	}
	
	public char[] read( Integer token ) throws InterruptedException
	{
		mutex.readLock( token );
		
		try
		{
			return doRead( );
		}
		finally
		{
			mutex.readUnLock( token );
		}
	}
	
	public void write( Integer token, char c ) throws InterruptedException
	{
		mutex.writeLock( token );
		
		try
		{
			doWrite( c );
		}
		finally
		{
			mutex.writeUnLock( token );
		}
	}
	
	private char[] doRead( )
	{
		char[] newbuf = new char[buffer.length];
		for ( int i = 0; i < buffer.length; i++ )
		{
			newbuf[i] = buffer[i];
			slowly( );
		}
		
		return newbuf;
	}
	
	private void doWrite( char c )
	{
		for ( int i = 0; i < buffer.length; i++ )
		{
			buffer[i] = c;
			slowly( );
		}
	}
	
	private void slowly( )
	{
		try
		{
			Thread.sleep( 50 );
		}
		catch ( InterruptedException e )
		{
			e.printStackTrace( );
		}
	}
}
