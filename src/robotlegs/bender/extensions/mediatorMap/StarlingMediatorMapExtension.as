//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.mediatorMap
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.mediatorMap.api.IStarlingMediatorMap;
	import robotlegs.bender.extensions.mediatorMap.impl.MediatorMap;
	import robotlegs.bender.extensions.mediatorMap.impl.StarlingMediatorMap;
	import robotlegs.bender.extensions.viewManager.api.IStarlingViewHandler;
	import robotlegs.bender.extensions.viewManager.api.IStarlingViewManager;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * This extension installs a shared IStarlingMediatorMap into the context
	 */
	public class StarlingMediatorMapExtension implements IExtension
	{
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var _injector:IInjector;
		
		private var _mediatorMap:StarlingMediatorMap;
		
		private var _viewManager:IStarlingViewManager;
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		/**
		 * @inheritDoc
		 */
		public function extend(context:IContext):void
		{
			context.beforeInitializing(beforeInitializing)
					.beforeDestroying(beforeDestroying)
					.whenDestroying(whenDestroying);
			_injector = context.injector;
			_injector.map(IStarlingMediatorMap).toSingleton(StarlingMediatorMap);
		}
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function beforeInitializing():void
		{
			_mediatorMap = _injector.getInstance(IStarlingMediatorMap);
			if (_injector.satisfiesDirectly(IStarlingViewManager))
			{
				_viewManager = _injector.getInstance(IStarlingViewManager);
				_viewManager.addViewHandler(_mediatorMap as IStarlingViewHandler);
			}
		}
		
		private function beforeDestroying():void
		{
			_mediatorMap.unmediateAll();
			if (_injector.satisfiesDirectly(IViewManager))
			{
				_viewManager = _injector.getInstance(IViewManager);
				_viewManager.removeViewHandler(_mediatorMap as IStarlingViewHandler);
			}
		}
		
		private function whenDestroying():void
		{
			if (_injector.satisfiesDirectly(IMediatorMap))
			{
				_injector.unmap(IMediatorMap);
			}
		}
	}
}

