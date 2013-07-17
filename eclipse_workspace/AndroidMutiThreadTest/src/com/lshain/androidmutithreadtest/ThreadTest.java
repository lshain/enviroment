package com.lshain.androidmutithreadtest;

import com.example.androidmutithreadtest.R;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class ThreadTest extends Activity
{
	
	@Override
	protected void onCreate( Bundle savedInstanceState )
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_thread_test );
	}
	
	@Override
	public boolean onCreateOptionsMenu( Menu menu )
	{
		getMenuInflater( ).inflate( R.menu.thread_test, menu );
		return true;
	}
}
