Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCFE606A31B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=UGMYcDZN
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 13796444;
	Mon, 26 Oct 2026 05:29:10 +0000 (UTC)
Received: from forward400e.mail.yandex.net (forward400e.mail.yandex.net
 [93.77.172.83])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6af7951a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Oct 2026 11:01:08 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-81.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-81.yp-c.yandex.net)
 by forward400e.mail.yandex.net (postfix) with ESMTPS id D61718227B;
 Thu, 22 Oct 2026 14:01:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81 with ESMTPSA id
 r0aYUT8iT0U0-xdsuATTg; Thu, 22 Oct 2026 14:01:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1792666866; bh=Ju1GO5nF+DPxlT4rvMWwMvX2/jQNMeX3uvt/jwfy670=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=UGMYcDZNq2b1DSC7AkWC5AHDZO5M1n1KM6KLqd9phpG7VzQ1rg/kdNafGyQwrh/EQ
 siZa0ffUDSnhcTsPgWNbnM3Jq4lCgHvgmZun4u87IUEEzMjWUafmi+NehmlnuVKsI8
 HpEqwduDDKY2G+RQ/xGi/qGUpa5RTkHM+Cj00GLY=
Authentication-Results: mail-nwsmtp-smtp-production-main-81;
 dkim=pass header.i=@yandex.ru
From: Roman Khromenok <roma55592@yandex.ru>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: [PATCH wireguard] wireguard: device: allow userspace to enable IPv6
 link-local addresses
Date: Thu, 22 Oct 2026 13:00:39 +0200
Message-ID: <20261022110039.270335-1-roma55592@yandex.ru>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Oct 2026 05:28:33 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WireGuard interfaces do not get an IPv6 link-local address by default,
which wg_open() achieves by setting addr_gen_mode to
IN6_ADDR_GEN_MODE_NONE on every ndo_open. A side effect is that any mode
chosen by userspace, via sysctl or IFLA_INET6_ADDR_GEN_MODE, is silently
reset on the next down/up cycle. Users running routing protocols over
WireGuard, such as Babel or OSPFv3, need fe80::/64 addresses and today
have to set the mode again after every ifup, which network managers do
not expect to have to do. For example, systemd-networkd cannot honor
LinkLocalAddressing=ipv6 on WireGuard interfaces because of this.

Instead, set the default once, when the inet6_dev is created. That
happens on NETDEV_REGISTER, both when the device is created and every
time it is moved to another network namespace, since addrconf tears down
the inet6_dev on NETDEV_UNREGISTER. So register a netdevice notifier
with a priority just below addrconf's, so that it runs after the
inet6_dev exists. The default behavior is unchanged, but userspace can
now opt in and the setting persists across down/up.

An alternative approach using IFF_NO_ADDRCONF was proposed in [1], but
it removes the ability to have link-local addresses altogether, and it
was reverted because it broke the selftests.

Add a selftest checking that link-local addresses are off by default,
that they can be enabled and survive down/up, and that the default is
restored after moving the device to another namespace.

Link: https://lists.zx2c4.com/pipermail/wireguard/2026-February/009496.html [1]
Link: https://github.com/systemd/systemd/issues/44005
Signed-off-by: Roman Khromenok <roma55592@yandex.ru>
---
Notes:

One pre-existing corner case is not addressed: if the MTU of a running
WireGuard interface drops below IPV6_MIN_MTU and is raised again, addrconf
destroys the inet6_dev and allocates a new one on NETDEV_CHANGEMTU, with the
default addr_gen_mode, and generates a link-local address in the same
notifier call, before any driver notifier gets a chance to run. Today that
address goes away on the next down/up, because wg_open() resets the mode;
with this patch it stays until userspace changes the mode. I don't see a
clean way to handle this from the driver, so I left it alone, but I'm happy
to look into it if you think it matters.

Tested with the wireguard selftests in QEMU: the new checks pass with this
patch, and the down/up check fails without it.

 drivers/net/wireguard/device.c             | 37 +++++++++++++++++++---
 tools/testing/selftests/wireguard/netns.sh | 14 ++++++++
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 67b07ee2d660..50f108a82a53 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -31,7 +31,6 @@ static LIST_HEAD(device_list);
 static int wg_open(struct net_device *dev)
 {
 	struct in_device *dev_v4 = __in_dev_get_rtnl(dev);
-	struct inet6_dev *dev_v6 = __in6_dev_get(dev);
 	struct wg_device *wg = netdev_priv(dev);
 	struct wg_peer *peer;
 	int ret;
@@ -44,8 +43,6 @@ static int wg_open(struct net_device *dev)
 		IN_DEV_CONF_SET(dev_v4, SEND_REDIRECTS, false);
 		IPV4_DEVCONF_ALL(dev_net(dev), SEND_REDIRECTS) = false;
 	}
-	if (dev_v6)
-		dev_v6->cnf.addr_gen_mode = IN6_ADDR_GEN_MODE_NONE;
 
 	mutex_lock(&wg->device_update_lock);
 	ret = wg_socket_init(wg, wg->incoming_port);
@@ -434,6 +431,31 @@ static struct pernet_operations pernet_ops __read_mostly = {
 	.exit_rtnl = wg_netns_exit_rtnl
 };
 
+static int wg_netdevice_notification(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	struct net_device *dev = netdev_notifier_info_to_dev(data);
+	struct inet6_dev *dev_v6;
+
+	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
+		return NOTIFY_DONE;
+
+	/* Disable IPv6 link-local address generation by default, but only
+	 * when the inet6_dev is created, which happens on device creation and
+	 * on every netns change, so that userspace may still opt in.
+	 */
+	dev_v6 = __in6_dev_get(dev);
+	if (dev_v6)
+		WRITE_ONCE(dev_v6->cnf.addr_gen_mode, IN6_ADDR_GEN_MODE_NONE);
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block netdevice_notifier = {
+	.notifier_call = wg_netdevice_notification,
+	/* Run after addrconf has created the inet6_dev. */
+	.priority = ADDRCONF_NOTIFY_PRIORITY - 1
+};
+
 int __init wg_device_init(void)
 {
 	int ret;
@@ -450,12 +472,18 @@ int __init wg_device_init(void)
 	if (ret)
 		goto error_vm;
 
-	ret = rtnl_link_register(&link_ops);
+	ret = register_netdevice_notifier(&netdevice_notifier);
 	if (ret)
 		goto error_pernet;
 
+	ret = rtnl_link_register(&link_ops);
+	if (ret)
+		goto error_netdevice;
+
 	return 0;
 
+error_netdevice:
+	unregister_netdevice_notifier(&netdevice_notifier);
 error_pernet:
 	unregister_pernet_device(&pernet_ops);
 error_vm:
@@ -468,6 +496,7 @@ int __init wg_device_init(void)
 void wg_device_uninit(void)
 {
 	rtnl_link_unregister(&link_ops);
+	unregister_netdevice_notifier(&netdevice_notifier);
 	unregister_pernet_device(&pernet_ops);
 	unregister_random_vmfork_notifier(&vm_notifier);
 	unregister_pm_notifier(&pm_notifier);
diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index a8f550aecb35..747a7e23b5fa 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -699,6 +699,20 @@ pp ip netns delete $netns2
 pp ip netns add $netns1
 pp ip netns add $netns2
 
+# Ensure that IPv6 link-local addresses are off by default, but can be enabled
+ip1 link add dev wg3 type wireguard
+ip1 link set up dev wg3
+[[ -z $(ip1 -6 addr show dev wg3 scope link) ]]
+n1 bash -c 'printf 3 > /proc/sys/net/ipv6/conf/wg3/addr_gen_mode'
+[[ $(ip1 -6 addr show dev wg3 scope link) == *fe80::* ]]
+ip1 link set down dev wg3
+ip1 link set up dev wg3
+[[ $(ip1 -6 addr show dev wg3 scope link) == *fe80::* ]]
+ip1 link set wg3 netns $netns2
+ip2 link set up dev wg3
+[[ -z $(ip2 -6 addr show dev wg3 scope link) ]]
+ip2 link del wg3
+
 # Ensure there aren't circular reference loops
 ip1 link add wg1 type wireguard
 ip2 link add wg2 type wireguard
-- 
2.47.3

