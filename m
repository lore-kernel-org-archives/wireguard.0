Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3797ECAAD2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Aug 2022 16:15:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2b3f2669;
	Mon, 29 Aug 2022 16:15:30 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id da34be25
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Aug 2022 19:22:04 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id n124so13532974oih.7
 for <wireguard@lists.zx2c4.com>; Thu, 25 Aug 2022 12:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=j11I9jJbBdP2EsV8zm8vGrZ8to2ALD+DZiEMfyWlhf4=;
 b=KjzVxnhpw6QKMn5c7oLhZ2YXfy0o0q7ppQDDA/IUG9Tba1CyII5IegLq2jiOsTx6sf
 9PktWYsvLhv6OduPZa78FKjas33U49IxO+UttcDOMAdp3MTlGJvDXLmU3ofAZEoFFqZT
 pafvPKdLl3l0hKSE9VWBcm6msZs1UGsFX0W0WhRtsci35MLKycrvSxbg6GiEiXprLSDz
 35gtzDXDspqbKE6U1rd+mL/P+1w92XWlGqtbdRRUw9gw3+q3FfhdBiDfZom+YIwlZBrE
 iSIuTPlKIwHdWrtxWrdA/Tch392Qi6e4omMMHzm85TUdvnZFdOZSQACivsWz9KW0c6uk
 JDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=j11I9jJbBdP2EsV8zm8vGrZ8to2ALD+DZiEMfyWlhf4=;
 b=PPdNkC241Ul3AvmQ8Ti5fPfZxTDd55bocFlz8tRMZeByi2rrmEjqX316ZPF2GjdNqO
 UR4K/b9e0B1KO9fb43AC56H4gwNoVacqpd3debu9cuzvOkJBkq/YAmIamVwWCYyW3Bcs
 RmGqPHY+xDPY4Rg49A7PdPy5yHBgPF0ivgxaG72SKPVaHc+d2/xUg4u8OCRh9IB46iQF
 pGIk/Qd/zymnNQOJ2iB+rnQDZl2cq8AU7BpLv+zb63fUW2i4b2U9evRl5B/Rcn8QQEE2
 MatTcugbnJzAu/CkdwUtyqT9NexJSpyFTJYLNA/pXw1gZiyY3ZKBsAfG/azBAZScK1QB
 6Mew==
X-Gm-Message-State: ACgBeo2u4MIS7vPA676AtbqqxDrpsxIupHxvCDHVkhlqkmxizLkRlDof
 SsBECNfYxkAdbx5WWsD/KPMTzSLXDNGoEKPlN+k8
X-Google-Smtp-Source: AA6agR5+NrNDgFeVEqQOH6xO8KzleveZvD24+0ma4hp6CR5I88pcrQbnickGgaR7sl54W0OczwK1VkCsRh+9Rsqv/HQ=
X-Received: by 2002:a05:6808:3a9:b0:343:4b14:ccce with SMTP id
 n9-20020a05680803a900b003434b14cccemr243316oie.41.1661455322788; Thu, 25 Aug
 2022 12:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825001830.1911524-1-kuba@kernel.org>
In-Reply-To: <20220825001830.1911524-1-kuba@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 25 Aug 2022 15:21:52 -0400
Message-ID: <CAHC9VhSxesi0TSSvcQSr1kDhP3Vce4+O3w2diEExGEGnjGpmiw@mail.gmail.com>
Subject: Re: [PATCH net-next] genetlink: start to validate reserved header
 bytes
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
 pabeni@redhat.com, jiri@resnulli.us, johannes@sipsolutions.net, 
 linux-block@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org, 
 linux-wpan@vger.kernel.org, wireguard@lists.zx2c4.com, 
 linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org, 
 target-devel@vger.kernel.org, linux-pm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-cifs@vger.kernel.org, 
 cluster-devel@redhat.com, mptcp@lists.linux.dev, lvs-devel@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 dev@openvswitch.org, linux-s390@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 29 Aug 2022 16:15:29 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Aug 24, 2022 at 8:18 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> We had historically not checked that genlmsghdr.reserved
> is 0 on input which prevents us from using those precious
> bytes in the future.
>
> One use case would be to extend the cmd field, which is
> currently just 8 bits wide and 256 is not a lot of commands
> for some core families.
>
> To make sure that new families do the right thing by default
> put the onus of opting out of validation on existing families.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: jiri@resnulli.us
> CC: johannes@sipsolutions.net
> CC: linux-block@vger.kernel.org
> CC: osmocom-net-gprs@lists.osmocom.org
> CC: linux-wpan@vger.kernel.org
> CC: wireguard@lists.zx2c4.com
> CC: linux-wireless@vger.kernel.org
> CC: linux-scsi@vger.kernel.org
> CC: target-devel@vger.kernel.org
> CC: linux-pm@vger.kernel.org
> CC: virtualization@lists.linux-foundation.org
> CC: linux-cifs@vger.kernel.org
> CC: cluster-devel@redhat.com
> CC: mptcp@lists.linux.dev
> CC: lvs-devel@vger.kernel.org
> CC: netfilter-devel@vger.kernel.org
> CC: linux-security-module@vger.kernel.org
> CC: dev@openvswitch.org
> CC: linux-s390@vger.kernel.org
> CC: tipc-discussion@lists.sourceforge.net
> ---
>  drivers/block/nbd.c                      | 1 +
>  drivers/net/gtp.c                        | 1 +
>  drivers/net/ieee802154/mac802154_hwsim.c | 1 +
>  drivers/net/macsec.c                     | 1 +
>  drivers/net/team/team.c                  | 1 +
>  drivers/net/wireguard/netlink.c          | 1 +
>  drivers/net/wireless/mac80211_hwsim.c    | 1 +
>  drivers/target/target_core_user.c        | 1 +
>  drivers/thermal/thermal_netlink.c        | 1 +
>  drivers/vdpa/vdpa.c                      | 1 +
>  fs/cifs/netlink.c                        | 1 +
>  fs/dlm/netlink.c                         | 1 +
>  fs/ksmbd/transport_ipc.c                 | 1 +
>  include/linux/genl_magic_func.h          | 1 +
>  include/net/genetlink.h                  | 3 +++
>  kernel/taskstats.c                       | 1 +
>  net/batman-adv/netlink.c                 | 1 +
>  net/core/devlink.c                       | 1 +
>  net/core/drop_monitor.c                  | 1 +
>  net/ethtool/netlink.c                    | 1 +
>  net/hsr/hsr_netlink.c                    | 1 +
>  net/ieee802154/netlink.c                 | 1 +
>  net/ieee802154/nl802154.c                | 1 +
>  net/ipv4/fou.c                           | 1 +
>  net/ipv4/tcp_metrics.c                   | 1 +
>  net/ipv6/ila/ila_main.c                  | 1 +
>  net/ipv6/ioam6.c                         | 1 +
>  net/ipv6/seg6.c                          | 1 +
>  net/l2tp/l2tp_netlink.c                  | 1 +
>  net/mptcp/pm_netlink.c                   | 1 +
>  net/ncsi/ncsi-netlink.c                  | 1 +
>  net/netfilter/ipvs/ip_vs_ctl.c           | 1 +
>  net/netlabel/netlabel_calipso.c          | 1 +
>  net/netlabel/netlabel_cipso_v4.c         | 1 +
>  net/netlabel/netlabel_mgmt.c             | 1 +
>  net/netlabel/netlabel_unlabeled.c        | 1 +
>  net/netlink/genetlink.c                  | 4 ++++
>  net/nfc/netlink.c                        | 1 +
>  net/openvswitch/conntrack.c              | 1 +
>  net/openvswitch/datapath.c               | 3 +++
>  net/openvswitch/meter.c                  | 1 +
>  net/psample/psample.c                    | 1 +
>  net/smc/smc_netlink.c                    | 3 ++-
>  net/smc/smc_pnet.c                       | 3 ++-
>  net/tipc/netlink.c                       | 1 +
>  net/tipc/netlink_compat.c                | 1 +
>  net/wireless/nl80211.c                   | 1 +
>  47 files changed, 56 insertions(+), 2 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com> (NetLabel)

-- 
paul-moore.com
