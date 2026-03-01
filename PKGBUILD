pkgname=omarchy-delta-theme-sync
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatic delta theme synchronization for Omarchy"
arch=('any')
license=('MIT')
depends=('bash' 'git-delta')
source=("$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  # Install scripts
  install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
  install -Dm755 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"

  # Install delta script
  install -Dm755 scripts/omarchy-delta-theme-apply "$pkgdir/usr/share/$pkgname/scripts/omarchy-delta-theme-apply"

  # Install hook
  install -Dm644 hooks-append/theme-set "$pkgdir/usr/share/$pkgname/hooks-append/theme-set"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
