
import 'package:meaden_app/app/mvpbase/MvpView.dart';

/**
 * Every presenter in the app must either implement this interface or extend BasePresenter
 * indicating the MvpView type that wants to be attached with.
 */
 class Presenter<V extends MvpView> {

    void attachView(V mvpView){}

    void detachView(){}
}