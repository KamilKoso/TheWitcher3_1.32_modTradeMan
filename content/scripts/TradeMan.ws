//#############################
//
// GiecuMan - 2016
// Fixed by Kosa - 2022
// TradeMan
//
//#############################

class CTradeMan {
	
	public var TradeManConfigWrapper		: CInGameConfigWrapper;
	public var Funds, ShopMult, PlayerMult	: float;
	public var Days							: int;
	
	public function T_InitializeValues() : void
	{
		TradeManConfigWrapper = theGame.GetInGameConfigWrapper();
		if (StringToFloat(TradeManConfigWrapper.GetVarValue('TradeMan_Main', 'TradeMan_DaysToFunds')) == 0)
		{
			TradeManConfigWrapper.SetVarValue('TradeMan_Main', 'TradeMan_Funds', FloatToString(100));
			TradeManConfigWrapper.SetVarValue('TradeMan_Main', 'TradeMan_DaysToFunds', FloatToString(5));
			TradeManConfigWrapper.SetVarValue('TradeMan_Main', 'TradeMan_ShopMult', FloatToString(100));
			TradeManConfigWrapper.SetVarValue('TradeMan_Main', 'TradeMan_PlayerMult', FloatToString(100));
			theGame.SaveUserSettings();
		}
		T_GetCurrentMult();
	}

	public function T_GetCurrentMult() : void
	{
		TradeManConfigWrapper = theGame.GetInGameConfigWrapper();
		Funds = StringToFloat(TradeManConfigWrapper.GetVarValue( 'TradeMan_Main', 'TradeMan_Funds' )) / 100;
		Days = (int)(StringToFloat(TradeManConfigWrapper.GetVarValue( 'TradeMan_Main', 'TradeMan_DaysToFunds' )));
		ShopMult = StringToFloat(TradeManConfigWrapper.GetVarValue( 'TradeMan_Main', 'TradeMan_ShopMult' )) / 100;
		PlayerMult = StringToFloat(TradeManConfigWrapper.GetVarValue( 'TradeMan_Main', 'TradeMan_PlayerMult' )) / 100;
	}
}