Return-Path: calvin@isi.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 126c2ac7
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 02:25:43 +0000 (UTC)
Received: from mail-c.ads.isi.edu (mail-c.ads.isi.edu [128.9.180.198])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dacc135
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 02:25:42 +0000 (UTC)
Date: Fri, 20 Jul 2018 19:34:24 -0700
From: Calvin Ardi <calvin@isi.edu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] tools: Makefile modifies scripts to look in SYSCONFDIR if
 set (was Re: wireguard-tools: hard coded config paths in wg-quick)
Message-ID: <20180721023424.GK31263@isi.edu>
References: <20180624155124.GP30528@isi.edu>
 <CAHmME9rTmU6LTtadmDs__btxBC7S8K_GVKnn47F5TEZ6n3WF-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAHmME9rTmU6LTtadmDs__btxBC7S8K_GVKnn47F5TEZ6n3WF-Q@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

On Tue, Jun 26, 2018 at 01:49:56AM +0200, Jason A. Donenfeld wrote:
> Hi Calvin,
> 
> That's a good suggestion, and probably something best handled by a
> small sed or replacement command in the homebrew formula, where you
> invoke the "brew path" command. Would you like to implement this and
> CC @zx2c4 on the github PR?
> 
> Regards,
> Jason
> 

I use MacPorts, so I'm not familiar with Homebrew, although I wouldn't
mind taking a look at the Homebrew formula in the future.

I created a patch for the Makefile that will use sed to edit in-place
`wg-quick` and its bash completion during `make install` to reflect a
customized SYSCONFDIR, if set.

I originally edited the files prior to install, but I think it's
preferable (and perhaps cleaner?) to edit the files after they've been
installed (keeping the original source intact).

The resulting changes should work for both darwin and freebsd platforms.
It would be great if this (plus any needed changes) was merged upstream,
but I'm okay for it to exist as a patch in the respective Portfile or
formula.

Thanks,
--calvin

---
 src/tools/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/tools/Makefile b/src/tools/Makefile
index a7cdaaa..0ac7fcf 100644
--- a/src/tools/Makefile
+++ b/src/tools/Makefile
@@ -16,6 +16,9 @@ WITH_BASHCOMPLETION ?=
 WITH_WGQUICK ?=
 WITH_SYSTEMDUNITS ?=
 
+# cross-platform sed for in-place editing
+SED := $(shell sed --version >/dev/null 2>&1 && echo "sed -i --" || echo "sed -i ''")
+
 ifeq ($(WITH_BASHCOMPLETION),)
 ifneq ($(strip $(wildcard $(BASHCOMPDIR))),)
 WITH_BASHCOMPLETION := yes
@@ -79,10 +82,14 @@ install: wg
 	install -v -d "$(DESTDIR)$(BASHCOMPDIR)" && install -v -m 0644 completion/wg.bash-completion "$(DESTDIR)$(BASHCOMPDIR)/wg"
 	@[ "$(WITH_WGQUICK)" = "yes" ] || exit 0; \
 	install -v -m 0755 wg-quick/$(PLATFORM).bash "$(DESTDIR)$(BINDIR)/wg-quick" && install -v -m 0700 -d "$(DESTDIR)$(SYSCONFDIR)/wireguard"
+	@[ "$(WITH_WGQUICK)" = "yes" -a "$(SYSCONFDIR)" != "/etc" ] || exit 0; \
+	$(SED) -e 's#^\(CONFIG_SEARCH_PATHS=.*\)\(/usr/local/etc\)#\1$(SYSCONFDIR)#' "$(DESTDIR)$(BINDIR)/wg-quick"
 	@[ "$(WITH_WGQUICK)" = "yes" ] || exit 0; \
 	install -v -m 0644 man/wg-quick.8 "$(DESTDIR)$(MANDIR)/man8/wg-quick.8"
 	@[ "$(WITH_WGQUICK)" = "yes" -a "$(WITH_BASHCOMPLETION)" = "yes" ] || exit 0; \
 	install -v -m 0644 completion/wg-quick.bash-completion "$(DESTDIR)$(BASHCOMPDIR)/wg-quick"
+	@[ "$(WITH_WGQUICK)" = "yes" -a "$(WITH_BASHCOMPLETION)" = "yes" -a "$(SYSCONFDIR)" != "/etc" ] || exit 0; \
+	$(SED) -e 's#\(search_paths+=.*\)\(/usr/local/etc\)#\1$(SYSCONFDIR)#' "$(DESTDIR)$(BASHCOMPDIR)/wg-quick"
 	@[ "$(WITH_WGQUICK)" = "yes" -a "$(WITH_SYSTEMDUNITS)" = "yes" ] || exit 0; \
 	install -v -d "$(DESTDIR)$(SYSTEMDUNITDIR)" && install -v -m 0644 systemd/wg-quick@.service "$(DESTDIR)$(SYSTEMDUNITDIR)/wg-quick@.service"
 
-- 
2.18.0
