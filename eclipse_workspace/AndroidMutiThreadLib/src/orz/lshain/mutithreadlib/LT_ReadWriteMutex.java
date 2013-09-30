package orz.lshain.mutithreadlib;

import java.util.ArrayList;

/**
 * 读写线程锁
 * 
 * @author gyh
 * 
 */
public class LT_ReadWriteMutex
{
	/**
	 * 正在读取的线程数
	 */
	private int mReadingCount = 0;
	private ArrayList< Integer > mReadingToken = new ArrayList< Integer >( );
	
	/**
	 * 正在等待写入的线程数
	 */
	private int mWaitingWriteCount = 0;
	
	/**
	 * 正在写入的线程数
	 */
	private int mWritingCount = 0;
	private ArrayList< Integer > mWritingToken = new ArrayList< Integer >( );
	
	/**
	 * 是否写入优先
	 */
	private boolean mPriorWrite = true;
	
	/**
	 * 获取读锁
	 * 
	 * @param token
	 * @throws InterruptedException
	 */
	public synchronized void readLock( Integer token ) throws InterruptedException, IllegalArgumentException
	{
		if ( mReadingToken.contains( token ) )
		{
			throw new IllegalArgumentException( "token repeat!" );
		}
		
		while ( mWritingCount > 0 || ( mPriorWrite && mWaitingWriteCount > 0 ) )
		{
			wait( );
		}
		
		mReadingCount++;
		mReadingToken.add( token );
	}
	
	/**
	 * 释放读锁
	 * 
	 * @param token
	 * @throws IllegalArgumentException
	 */
	public synchronized void readUnLock( Integer token ) throws IllegalArgumentException
	{
		if ( !mReadingToken.contains( token ) )
		{
			throw new IllegalArgumentException( "token repeat!" );
		}
		
		mPriorWrite = true;
		
		mReadingCount--;
		mReadingToken.remove( token );
		notifyAll( );
	}
	
	/**
	 * 获取写锁
	 * 
	 * @param token
	 * @throws InterruptedException
	 * @throws IllegalArgumentException
	 */
	public synchronized void writeLock( Integer token ) throws InterruptedException, IllegalArgumentException
	{
		if ( mWritingToken.contains( token ) )
		{
			throw new IllegalArgumentException( "token repeat!" );
		}
		
		mWaitingWriteCount++;
		try
		{
			while ( mReadingCount > 0 || mWritingCount > 0 )
			{
				wait( );
			}
		}
		finally
		{
			mWaitingWriteCount--;
		}
		
		mWritingCount++;
		mWritingToken.add( token );
	}
	
	/**
	 * 释放写锁
	 * 
	 * @param token
	 * @throws IllegalArgumentException
	 */
	public synchronized void writeUnLock( Integer token ) throws IllegalArgumentException
	{
		if ( !mWritingToken.contains( token ) )
		{
			throw new IllegalArgumentException( "token repeat!" );
		}
		
		mPriorWrite = false;
		
		mWritingCount--;
		mWritingToken.remove( token );
		notifyAll( );
	}
}
