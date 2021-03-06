
#ifndef obj_handles_hpp
#define obj_handles_hpp

#include <qlo/handleimpl.hpp>
#include <rp/libraryobject.hpp>
#include <qlo/obj_termstructures.hpp>
#include <qlo/objmanual_quote.hpp>
#include <qlo/conversions/coercetermstructure.hpp>

namespace QuantLibAddin {

    class RelinkableHandleYieldTermStructure : public RelinkableHandleImpl<QuantLibAddin::YieldTermStructure, QuantLib::YieldTermStructure>{
    public:
        RelinkableHandleYieldTermStructure(const boost::shared_ptr<reposit::ValueObject> &properties,
            const std::string &linkTo,
            bool permanent) : RelinkableHandleImpl<QuantLibAddin::YieldTermStructure, QuantLib::YieldTermStructure>(properties, linkTo, permanent) {}

    };

    class RelinkableHandleQuote : public RelinkableHandleImpl<QuantLibAddin::Quote, QuantLib::Quote>{
    public:
        RelinkableHandleQuote(const boost::shared_ptr<reposit::ValueObject> &properties,
            const std::string &linkTo,
            bool permanent) : RelinkableHandleImpl<QuantLibAddin::Quote, QuantLib::Quote>(properties, linkTo, permanent) {}

    };
} // namespace QuantLibAddin

#endif

