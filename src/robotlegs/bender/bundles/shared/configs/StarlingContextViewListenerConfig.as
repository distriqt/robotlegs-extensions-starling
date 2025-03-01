//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.bundles.shared.configs
{
	import robotlegs.bender.extensions.viewManager.api.IStarlingViewManager;
	import robotlegs.bender.framework.api.IConfig;
	
	import starling.display.DisplayObjectContainer;
	
	
	/**
	 * This simple configuration adds the mapped DisplayObjectContainer ("contextView")
	 * to the viewManager.
	 */
	public class StarlingContextViewListenerConfig implements IConfig
	{
		
		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/
		
		[Inject]
		public var contextView:DisplayObjectContainer;
		
		[Inject]
		public var viewManager:IStarlingViewManager;
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		public function configure():void
		{
			viewManager.addContainer( contextView );
		}
	}
}
