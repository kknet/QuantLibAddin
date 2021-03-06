
%group(processes);

%insert(processes_library_hpp) %{
#include <ql/processes/blackscholesprocess.hpp>
%}

%insert(processes_addin_cpp) %{
#include <qlo/objmanual_quote.hpp>
#include <qlo/obj_volatilities.hpp>
%}

namespace QuantLib {

    class GeneralizedBlackScholesProcess {};

    class BlackScholesMertonProcess : public GeneralizedBlackScholesProcess {
      public:
        %generate(c++, BlackScholesMertonProcess);
        %generate(c#, BlackScholesMertonProcess);
        %generate(countify, BlackScholesMertonProcess);
        BlackScholesMertonProcess(
            const Handle<Quote>& x0,
            const Handle<YieldTermStructure>& dividendTS,
            const Handle<YieldTermStructure>& riskFreeTS,
            const Handle<BlackVolTermStructure>& blackVolTS);
    };
}

