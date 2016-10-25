//
//// These are types which require specific typemaps to be defined.  Tell the
//// reposit SWIG module to treat these types as strings, that causes some of the
//// necessary typemaps to be generated, the rest are defined in this project.
//%apply rp_tp_string { QuantLib::Period & };
//%apply rp_tp_string { QuantLib::Schedule & };
//%apply rp_tp_string { QuantLib::OptimizationMethod & };
//%apply rp_tp_string { QuantLib::EndCriteria & };
//%apply rp_tp_string { QuantLib::Leg & };

//// Enumerated types.
//ENUMERATED_TYPE(QuantLib::Currency)
//ENUMERATED_TYPE(QuantLib::Compounding)
//ENUMERATED_TYPE(QuantLib::Option::Type)
ENUMERATED_TYPE(QuantLib::Frequency)
//ENUMERATED_TYPE(QuantLib::BusinessDayConvention)
//ENUMERATED_TYPE(QuantLib::Futures::Type)
//ENUMERATED_TYPE(QuantLib::DateGeneration::Rule)
//ENUMERATED_TYPE(QuantLib::VanillaSwap::Type)
//ENUMERATED_TYPE(QuantLib::Pillar::Choice)
//ENUMERATED_TYPE(QuantLib::Position::Type)
//ENUMERATED_TYPE(QuantLib::Duration::Type)
//ENUMERATED_TYPE(QuantLib::SensitivityAnalysis)
ENUMERATED_TYPE(QuantLib::Weekday)
ENUMERATED_TYPE(QuantLib::Month)
//ENUMERATED_TYPE(QuantLib::MixedInterpolation::Behavior)
//ENUMERATED_TYPE(QuantLib::GFunctionFactory::YieldCurveModel)
//ENUMERATED_TYPE(QuantLib::Protection::Side)
//ENUMERATED_TYPE(QuantLib::Seniority)
//
//ENUMERATED_TYPE(QuantLibAddin::RateHelper::DepoInclusionCriteria)
//ENUMERATED_TYPE(QuantLibAddin::SwapIndex::FixingType)
//
//// Enumerated classes.
//ENUMERATED_CLASS(QuantLib::Calendar)
//ENUMERATED_CLASS(QuantLib::DayCounter)
//
//%define QL_OBJECT_WRAPPER(T...)
//namespace QuantLib {
//    class T;
//}
//OBJECT_WRAPPER(QuantLibAddin::T, QuantLib::T)
//%enddef
//
//// Data types of objects passed as function parameters to be retrieved from the repository
//QL_OBJECT_WRAPPER(Index)
//QL_OBJECT_WRAPPER(IborIndex)
//QL_OBJECT_WRAPPER(SwapIndex)
//QL_OBJECT_WRAPPER(OvernightIndex)
//QL_OBJECT_WRAPPER(PricingEngine)
//QL_OBJECT_WRAPPER(StrikedTypePayoff)
//QL_OBJECT_WRAPPER(Exercise)
//QL_OBJECT_WRAPPER(GeneralizedBlackScholesProcess)
//QL_OBJECT_WRAPPER(Schedule)
//QL_OBJECT_WRAPPER(OneFactorAffineModel)
//QL_OBJECT_WRAPPER(ShortRateModel)
//QL_OBJECT_WRAPPER(G2)
//QL_OBJECT_WRAPPER(VanillaSwap)
//QL_OBJECT_WRAPPER(Instrument)
//QL_OBJECT_WRAPPER(InterestRateIndex)
//QL_OBJECT_WRAPPER(CalibrationHelper)
//QL_OBJECT_WRAPPER(SwaptionHelper)
//QL_OBJECT_WRAPPER(CalibratedModel)
//QL_OBJECT_WRAPPER(RateHelper)
//QL_OBJECT_WRAPPER(Extrapolator)
//QL_OBJECT_WRAPPER(FloatingRateCouponPricer)
//QL_OBJECT_WRAPPER(Bond)
//QL_OBJECT_WRAPPER(TimeSeriesDef)
//QL_OBJECT_WRAPPER(DiscountCurve)
//QL_OBJECT_WRAPPER(ZeroCurve)
//QL_OBJECT_WRAPPER(ForwardCurve)
//QL_OBJECT_WRAPPER(FlatForward)
//QL_OBJECT_WRAPPER(ForwardSpreadedTermStructure)
//QL_OBJECT_WRAPPER(ImpliedTermStructure)
//QL_OBJECT_WRAPPER(TermStructure)
//QL_OBJECT_WRAPPER(InterpolatedYieldCurve)
//QL_OBJECT_WRAPPER(CmsCouponPricer)
//QL_OBJECT_WRAPPER(CorrelationTermStructure)
//QL_OBJECT_WRAPPER(BaseModel)
//QL_OBJECT_WRAPPER(DefaultProbabilityTermStructure)
//QL_OBJECT_WRAPPER(Basket)
//QL_OBJECT_WRAPPER(DefaultLossModel)
//QL_OBJECT_WRAPPER(Issuer)
//QL_OBJECT_WRAPPER(DefaultProbabilityHelper)
//QL_OBJECT_WRAPPER(DefaultEventSet)
//QL_OBJECT_WRAPPER(CreditDefaultSwap)
//
//// QuantLib Handles.
//QUANTLIB_HANDLE(QuantLibAddin::FlatForward, QuantLib::YieldTermStructure)
//QUANTLIB_HANDLE(QuantLibAddin::BlackConstantVol, QuantLib::BlackVolTermStructure)
//QUANTLIB_HANDLE(QuantLibAddin::Quote, QuantLib::Quote)
//QUANTLIB_HANDLE(QuantLibAddin::SwaptionVolatilityStructure, QuantLib::SwaptionVolatilityStructure)
//QUANTLIB_HANDLE(QuantLibAddin::DefaultProbabilityTermStructure, QuantLib::DefaultProbabilityTermStructure)
//
//// Override some of the typemaps that were generated by the macro above.
//
//%typemap(rp_tm_xll_cnvt) QuantLib::Handle<QuantLib::Quote> const & %{
//        reposit::property_t $1_name_cnv = reposit::convert<reposit::property_t>(
//            reposit::ConvertOper(*$1_name));
//        QuantLib::Handle<QuantLib::Quote> $1_name_handle = 
//            reposit::convert<QuantLib::Handle<QuantLib::Quote> >(
//                reposit::ConvertOper(*$1_name), "$1_name");
//%}
//
////FIXME this is duplicated in addinexcel.i but if i delete it here then the autogenerated code changes...?
//%typemap(rp_tm_xll_cnvt) QuantLib::Handle<QuantLib::YieldTermStructure> const & %{
//        std::string $1_name_vo = reposit::convert<std::string>(
//            reposit::ConvertOper(*$1_name), "$1_name", "");
//
//        RP_GET_OBJECT_DEFAULT($1_nameCoerce, $1_name_vo, reposit::Object)
//        QuantLib::Handle<QuantLib::YieldTermStructure> $1_name_handle =
//            QuantLibAddin::CoerceHandle<
//                QuantLibAddin::YieldTermStructure,
//                QuantLib::YieldTermStructure>()(
//                    $1_nameCoerce, QuantLib::Handle<QuantLib::YieldTermStructure>());
//%}
//
//%typemap(rp_tm_csh_cnvt) QuantLib::Handle<QuantLib::YieldTermStructure> const & %{
//        RP_GET_OBJECT_DEFAULT($1_nameCoerce, std::string($1_name), reposit::Object)
//        QuantLib::Handle<QuantLib::YieldTermStructure> $1_name_handle =
//            QuantLibAddin::CoerceHandle<
//                QuantLibAddin::YieldTermStructure,
//                QuantLib::YieldTermStructure>()(
//                    $1_nameCoerce, QuantLib::Handle<QuantLib::YieldTermStructure>());
//%}
//
//%typemap(rp_tm_cfy_cnvt) QuantLib::Handle<QuantLib::YieldTermStructure> const & %{
//        RP_GET_OBJECT_DEFAULT($1_name_get, std::string($1_name), reposit::Object)
//        QuantLib::Handle<QuantLib::YieldTermStructure> $1_name_handle =
//            QuantLibAddin::CoerceHandle<
//                QuantLibAddin::YieldTermStructure,
//                QuantLib::YieldTermStructure>()(
//                    $1_name_get, QuantLib::Handle<QuantLib::YieldTermStructure>());
//%}
//
//%typemap(rp_tm_lib_loop) QuantLib::YieldTermStructure "boost::shared_ptr<QuantLib::YieldTermStructure>";
//
