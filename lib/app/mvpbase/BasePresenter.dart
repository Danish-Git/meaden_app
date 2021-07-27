import 'package:flutter/material.dart';
import 'package:meaden_app/app/mvpbase/MvpView.dart';
import 'package:meaden_app/app/mvpbase/Presenter.dart';

/**
 * <p/>
 * Base class that implements the Presenter interface and provides a base implementation for
 * attachView() and detachView(). It also handles keeping a reference to the mvpView that
 * can be accessed from the children classes by calling getMvpView().
 */
class BasePresenter<_T extends MvpView> implements Presenter<_T> {

  _T mMvpView;

  BasePresenter({@required this.mMvpView});

  @override
  void attachView(_T mvpView) {
    mMvpView = mvpView;
  }

  @override
  void detachView() {
    mMvpView = null;
  }

  bool isViewAttached() {
    return mMvpView != null;
  }

  _T getMvpView() {
    return mMvpView;
  }

  void checkViewAttached() {
    if (!isViewAttached()) MvpViewNotAttachedException();
  }

/*     class MvpViewNotAttachedException extends RuntimeException {
         */ /*MvpViewNotAttachedException() {
            super("Please call Presenter.attachView(MvpView) before" +
                    " requesting data to the Presenter");*/ /*
        }
    }*/
}

class MvpViewNotAttachedException implements Exception {
  String cause;

  MvpViewNotAttachedException() {
    this.cause =
        "Please call Presenter.attachView(MvpView) before requesting data to the Presenter";
  }
}
