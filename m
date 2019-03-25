Return-Path: <SRS0=43sN=R5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0369EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Mar 2019 07:44:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5F2B20828
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Mar 2019 07:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5F2B20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=strong.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5eb7474;
	Tue, 26 Mar 2019 07:43:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48c55c12
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 23:09:43 +0000 (UTC)
Received: from smtp.netregistry.net (smtp.netregistry.net [202.124.241.204])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a39ced9b
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 23:09:43 +0000 (UTC)
Received: from pa49-182-0-79.pa.qld.optusnet.com.au ([49.182.0.79]:37184
 helo=localhost)
 by smtp-1.servers.netregistry.net protocol: esmtpa (Exim 4.89 #1 (Debian))
 id 1h8Yjo-0006ZQ-03
 for <wireguard@lists.zx2c4.com>; Tue, 26 Mar 2019 10:10:40 +1100
Date: Tue, 26 Mar 2019 09:10:37 +1000
From: Russell Strong <russell@strong.id.au>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Adds DSCP configuration to wireguard devices
Message-ID: <20190326091037.20aa816b@strong.id.au>
In-Reply-To: <20190318210309.5dcb8375@strong.id.au>
References: <20190318210309.5dcb8375@strong.id.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Authenticated-User: russell@strong.id.au
X-Mailman-Approved-At: Tue, 26 Mar 2019 08:43:35 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, 18 Mar 2019 21:03:09 +1000
Russell Strong <russell@strong.id.au> wrote:

Hi,

Noting the previous opinions on DSCP markings and security, I'd like to
ask if the position on DSCP markings can be changed.  I have not seen
the case below put forward, i.e. When the underlying network is
private and trusted to handle those markings.  In some cases won't
perform well without them, e.g. radio mesh networks.

Thoughts?

Regards,

Russell

> From c6c1699dc89bcc43f8045d74db4fece63b9cc546 Mon Sep 17 00:00:00 2001
> From: Russell Strong <russell@strong.id.au>
> Date: Wed, 6 Mar 2019 10:42:33 +1000
> Subject: [PATCH] Adds DSCP configuration to wireguard devices.
> 
> 1. handshake-dscp allows the setting of dscp code on handshake
> packets to something other than AF41.  AF41 remains the default if
> not specifed 2. inherit-dscp permits copying of dscp markers from the
> inner packet to the encapsulating packet.  When not specifed the
> default behaviour is to zero out the dscp.
> 
> Updates wg tool for the above two parameters.
> 
> Updates man page for new parameters and adds a privacy statement.
> This statement is intended to prompt users to think about their
> security and privacy circumstances.
> 
> So why add these controls?
> 
> 1. When using wireguard as part of a network infrastructure, to
> create cryptographically separated communities of interest. CS6 is
> often used for Network Control traffic ( RFC 4594 )
> 
> 2. Some communications links, particularly TDMA radio meshes and
> SATCOM, require dscp markings to schedule access to the
> mesh/satellite.  Without it voice and video will not work.  These
> communication links then take on the responsibility for hiding the
> DSCP over the air.
> 
> 3. WireGuard does not hide packet sizes, inter packet timing, etc.
> Where security requires an underlying network that provides this.
> DSCP marking will also be needed so the underlying network can
> provide QoS.  The underlying network takes responsibility for hiding
> the QoS and other traffic characteristics from eavesdropping. ---
> src/device.c                            |   1 +
> src/device.h                            |   2 +
> src/messages.h                          |   2 +-
> src/netlink.c                           |  16 ++
> src/send.c                              |  16 +-
> src/tools/completion/wg.bash-completion |   8 +-
> src/tools/config.c                      | 197
> ++++++++++++++++++++++++ src/tools/containers.h                  |
> 6 +- src/tools/ipc.c                         |  22 +++
> src/tools/man/wg.8                      |  19 ++-
> src/tools/set.c                         |   2 +-
> src/tools/show.c                        |  16 +-
> src/tools/showconf.c                    |   4 +
> src/uapi/wireguard.h                    |   6 + 14 files changed, 301
> insertions(+), 16 deletions(-)
> 
> diff --git a/src/device.c b/src/device.c
> index 2866dd9..6ad1cbc 100644
> --- a/src/device.c
> +++ b/src/device.c
> @@ -314,6 +314,7 @@ static int wg_newlink(struct net *src_net, struct
> net_device *dev, wg_cookie_checker_init(&wg->cookie_checker, wg);
>  	INIT_LIST_HEAD(&wg->peer_list);
>  	wg->device_update_gen = 1;
> +	wg->handshake_dscp = DEFAULT_HANDSHAKE_DSCP;
>  
>  	wg->peer_hashtable = wg_pubkey_hashtable_alloc();
>  	if (!wg->peer_hashtable)
> diff --git a/src/device.h b/src/device.h
> index 7e7e216..e6736ff 100644
> --- a/src/device.h
> +++ b/src/device.h
> @@ -57,6 +57,8 @@ struct wg_device {
>  	u32 fwmark;
>  	u16 incoming_port;
>  	bool have_creating_net_ref;
> +	u8 handshake_dscp;
> +	u8 inherit_dscp;
>  };
>  
>  int wg_device_init(void);
> diff --git a/src/messages.h b/src/messages.h
> index 3cfd1c5..9dc425b 100644
> --- a/src/messages.h
> +++ b/src/messages.h
> @@ -123,6 +123,6 @@ enum message_alignments {
>  #define DATA_PACKET_HEAD_ROOM \
>  	ALIGN(sizeof(struct message_data) + SKB_HEADER_LEN, 4)
>  
> -enum { HANDSHAKE_DSCP = 0x88 /* AF41, plus 00 ECN */ };
> +enum { DEFAULT_HANDSHAKE_DSCP = 0x88 /* AF41, plus 00 ECN */ };
>  
>  #endif /* _WG_MESSAGES_H */
> diff --git a/src/netlink.c b/src/netlink.c
> index b179b31..fd49eef 100644
> --- a/src/netlink.c
> +++ b/src/netlink.c
> @@ -24,6 +24,8 @@ static const struct nla_policy
> device_policy[WGDEVICE_A_MAX + 1] =
> { [WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
> [WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
> [WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
> +	[WGDEVICE_A_HANDSHAKE_DSCP]	= { .type = NLA_U8 },
> +	[WGDEVICE_A_INHERIT_DSCP]	= { .type = NLA_U8 },
>  	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
>  };
>  
> @@ -228,6 +230,8 @@ static int wg_get_device_dump(struct sk_buff
> *skb, struct netlink_callback *cb) if (nla_put_u16(skb,
> WGDEVICE_A_LISTEN_PORT, wg->incoming_port) ||
>  		    nla_put_u32(skb, WGDEVICE_A_FWMARK, wg->fwmark)
> ||
> +		    nla_put_u8(skb, WGDEVICE_A_HANDSHAKE_DSCP,
> wg->handshake_dscp) ||
> +		    nla_put_u8(skb, WGDEVICE_A_INHERIT_DSCP,
> wg->inherit_dscp) || nla_put_u32(skb, WGDEVICE_A_IFINDEX,
> wg->dev->ifindex) || nla_put_string(skb, WGDEVICE_A_IFNAME,
> wg->dev->name)) goto out;
> @@ -499,6 +503,8 @@ static int wg_set_device(struct sk_buff *skb,
> struct genl_info *info) 
>  	ret = -EPERM;
>  	if ((info->attrs[WGDEVICE_A_LISTEN_PORT] ||
> +	     info->attrs[WGDEVICE_A_HANDSHAKE_DSCP] ||
> +	     info->attrs[WGDEVICE_A_INHERIT_DSCP] ||
>  	     info->attrs[WGDEVICE_A_FWMARK]) &&
>  	    !ns_capable(wg->creating_net->user_ns, CAP_NET_ADMIN))
>  		goto out;
> @@ -513,6 +519,16 @@ static int wg_set_device(struct sk_buff *skb,
> struct genl_info *info) wg_socket_clear_peer_endpoint_src(peer);
>  	}
>  
> +	if (info->attrs[WGDEVICE_A_HANDSHAKE_DSCP])
> +		wg->handshake_dscp =
> nla_get_u8(info->attrs[WGDEVICE_A_HANDSHAKE_DSCP]) & 0xfc; +
> +	if (info->attrs[WGDEVICE_A_INHERIT_DSCP]) {
> +		if (nla_get_u8(info->attrs[WGDEVICE_A_INHERIT_DSCP])
> == 0)
> +			wg->inherit_dscp=0;
> +		else
> +			wg->inherit_dscp=1;
> +	}
> +
>  	if (info->attrs[WGDEVICE_A_LISTEN_PORT]) {
>  		ret = set_port(wg,
>  			nla_get_u16(info->attrs[WGDEVICE_A_LISTEN_PORT]));
> diff --git a/src/send.c b/src/send.c
> index b0df5c7..7810f1e 100644
> --- a/src/send.c
> +++ b/src/send.c
> @@ -39,7 +39,7 @@ static void
> wg_packet_send_handshake_initiation(struct wg_peer *peer)
> atomic64_set(&peer->last_sent_handshake, ktime_get_boot_fast_ns());
>  		wg_socket_send_buffer_to_peer(peer, &packet,
> sizeof(packet),
> -					      HANDSHAKE_DSCP);
> +
> peer->device->handshake_dscp); wg_timers_handshake_initiated(peer);
>  	}
>  }
> @@ -103,7 +103,7 @@ void wg_packet_send_handshake_response(struct
> wg_peer *peer) ktime_get_boot_fast_ns());
>  			wg_socket_send_buffer_to_peer(peer, &packet,
>  						      sizeof(packet),
> -
> HANDSHAKE_DSCP);
> +
> peer->device->handshake_dscp); }
>  	}
>  }
> @@ -389,10 +389,14 @@ void wg_packet_send_staged_packets(struct
> wg_peer *peer)
>  	 * handshake.
>  	 */
>  	skb_queue_walk(&packets, skb) {
> -		/* 0 for no outer TOS: no leak. TODO: at some later
> point, we
> -		 * might consider using flowi->tos as outer instead.
> -		 */
> -		PACKET_CB(skb)->ds = ip_tunnel_ecn_encap(0,
> ip_hdr(skb), skb);
> +		__u8 ds = 0;
> +		if (peer->device->inherit_dscp) {
> +			if (skb->protocol == htons(ETH_P_IP))
> +				ds = ipv4_get_dsfield(ip_hdr(skb)) &
> ~INET_ECN_MASK;
> +			else if (skb->protocol == htons(ETH_P_IPV6))
> +				ds = ipv6_get_dsfield(ipv6_hdr(skb))
> & ~INET_ECN_MASK;
> +		}
> +		PACKET_CB(skb)->ds = ip_tunnel_ecn_encap(ds,
> ip_hdr(skb), skb); PACKET_CB(skb)->nonce =
>  				atomic64_inc_return(&key->counter.counter)
> - 1; if (unlikely(PACKET_CB(skb)->nonce >= REJECT_AFTER_MESSAGES))
> diff --git a/src/tools/completion/wg.bash-completion
> b/src/tools/completion/wg.bash-completion index cc6ac06..a9042c7
> 100644 --- a/src/tools/completion/wg.bash-completion
> +++ b/src/tools/completion/wg.bash-completion
> @@ -22,7 +22,7 @@ _wg_completion() {
>  	fi
>  
>  	if [[ $COMP_CWORD -eq 3 && ${COMP_WORDS[1]} == show &&
> ${COMP_WORDS[2]} != interfaces ]]; then
> -		COMPREPLY+=( $(compgen -W "public-key private-key
> listen-port peers preshared-keys endpoints allowed-ips fwmark
> latest-handshakes persistent-keepalive transfer dump" --
> "${COMP_WORDS[3]}") )
> +		COMPREPLY+=( $(compgen -W "public-key private-key
> listen-port peers preshared-keys endpoints allowed-ips fwmark
> handshake-dscp inherit-dscp latest-handshakes persistent-keepalive
> transfer dump" -- "${COMP_WORDS[3]}") ) return fi 
> @@ -35,10 +35,12 @@ _wg_completion() {
>  
>  	[[ ${COMP_WORDS[1]} == set ]] || return
>  
> -	local has_listen_port=0 has_fwmark=0 has_private_key=0
> has_preshared_key=0 has_peer=0 has_remove=0 has_endpoint=0
> has_persistent_keepalive=0 has_allowed_ips=0 words=() i j
> +	local has_listen_port=0 has_fwmark=0 has_handshake_dscp=0
> has_inherit_dscp=0 has_private_key=0 has_preshared_key=0 has_peer=0
> has_remove=0 has_endpoint=0 has_persistent_keepalive=0
> has_allowed_ips=0 words=() i j for ((i=3;i<COMP_CWORD;i+=2)); do
> [[ ${COMP_WORDS[i]} == listen-port ]] && has_listen_port=1
> [[ ${COMP_WORDS[i]} == fwmark ]] && has_fwmark=1
> +		[[ ${COMP_WORDS[i]} == handshake-dscp ]] &&
> has_handshake_dscp=1
> +		[[ ${COMP_WORDS[i]} == inherit-dscp ]] &&
> has_inherit_dscp=1 [[ ${COMP_WORDS[i]} == private-key ]] &&
> has_private_key=1 [[ ${COMP_WORDS[i]} == peer ]] && { has_peer=$i;
> break; } done
> @@ -46,6 +48,8 @@ _wg_completion() {
>  		if ((COMP_CWORD % 2 != 0)); then
>  			[[ $has_listen_port -eq 1 ]] ||
> words+=( listen-port ) [[ $has_fwmark -eq 1 ]] || words+=( fwmark )
> +			[[ $has_handshake_dscp -eq 1 ]] ||
> words+=( handshake-dscp )
> +			[[ $has_inherit_dscp -eq 1 ]] ||
> words+=( inherit-dscp ) [[ $has_private_key -eq 1 ]] ||
> words+=( private-key ) words+=( peer )
>  			COMPREPLY+=( $(compgen -W "${words[*]}" --
> "${COMP_WORDS[COMP_CWORD]}") ) diff --git a/src/tools/config.c
> b/src/tools/config.c index 5d15356..f1d076e 100644
> --- a/src/tools/config.c
> +++ b/src/tools/config.c
> @@ -104,6 +104,189 @@ err:
>  	return false;
>  }
>  
> +static inline bool parse_handshake_dscp(uint8_t *handshake_dscp,
> uint32_t *flags, const char *value) +{
> +	unsigned long ret;
> +	char *end;
> +	int base = 10;
> +
> +	if (!strcasecmp(value, "cs6")) {
> +		*handshake_dscp = 0xc0;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "ef")) {
> +		*handshake_dscp = 0xb8;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "cs5")) {
> +		*handshake_dscp = 0xa0;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af41")) {
> +		*handshake_dscp = 0x88;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af42")) {
> +		*handshake_dscp = 0x90;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af43")) {
> +		*handshake_dscp = 0x98;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "cs4")) {
> +		*handshake_dscp = 0x80;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af31")) {
> +		*handshake_dscp = 0x68;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af32")) {
> +		*handshake_dscp = 0x70;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af33")) {
> +		*handshake_dscp = 0x78;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "cs3")) {
> +		*handshake_dscp = 0x60;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af21")) {
> +		*handshake_dscp = 0x48;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af22")) {
> +		*handshake_dscp = 0x50;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af23")) {
> +		*handshake_dscp = 0x58;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "cs2")) {
> +		*handshake_dscp = 0x40;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af11")) {
> +		*handshake_dscp = 0x28;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af12")) {
> +		*handshake_dscp = 0x30;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "af13")) {
> +		*handshake_dscp = 0x38;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "cs0") || !strcasecmp(value, "df")) {
> +		*handshake_dscp = 0x00;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "cs1")) {
> +		*handshake_dscp = 0x20;
> +		*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		return true;
> +	}
> +
> +	if (!isdigit(value[0]))
> +		goto err;
> +
> +	if (strlen(value) > 2 && value[0] == '0' && value[1] == 'x')
> +		base = 16;
> +
> +	ret = strtoul(value, &end, base);
> +	if (*end || ret > 0xfc || (ret & 0x03))
> +		goto err;
> +
> +	*handshake_dscp = ret;
> +	*flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +	return true;
> +err:
> +	fprintf(stderr, "Handshake DSCP is neither a DSCP name or
> valid value: `%s'\n", value);
> +	return false;
> +}
> +
> +static inline bool parse_inherit_dscp(uint8_t *inherit_dscp,
> uint32_t *flags, const char *value) +{
> +	unsigned long ret;
> +	char *end;
> +	int base = 10;
> +
> +	if (!strcasecmp(value, "off")) {
> +		*inherit_dscp = 0;
> +		*flags |= WGDEVICE_HAS_INHERIT_DSCP;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(value, "on")) {
> +		*inherit_dscp = 1;
> +		*flags |= WGDEVICE_HAS_INHERIT_DSCP;
> +		return true;
> +	}
> +
> +	if (!isdigit(value[0]))
> +		goto err;
> +
> +	if (strlen(value) > 2 && value[0] == '0' && value[1] == 'x')
> +		base = 16;
> +
> +	ret = strtoul(value, &end, base);
> +	if (*end || ret > UINT8_MAX)
> +		goto err;
> +
> +	if (ret == 0)
> +		*inherit_dscp = 0;
> +	else
> +		*inherit_dscp = 1;
> +	*flags |= WGDEVICE_HAS_INHERIT_DSCP;
> +	return true;
> +err:
> +	fprintf(stderr, "Inherit DSCP is neither 0/off nor
> on/1-0xff: `%s'\n", value);
> +	return false;
> +}
> +
>  static inline bool parse_key(uint8_t key[static WG_KEY_LEN], const
> char *value) {
>  	if (!key_from_base64(key, value)) {
> @@ -394,6 +577,10 @@ static bool process_line(struct config_ctx *ctx,
> const char *line) ret = parse_port(&ctx->device->listen_port,
> &ctx->device->flags, value); else if (key_match("FwMark"))
>  			ret = parse_fwmark(&ctx->device->fwmark,
> &ctx->device->flags, value);
> +		else if (key_match("HandshakeDSCP"))
> +			ret =
> parse_handshake_dscp(&ctx->device->handshake_dscp,
> &ctx->device->flags, value);
> +		else if (key_match("InheritDSCP"))
> +			ret =
> parse_inherit_dscp(&ctx->device->inherit_dscp, &ctx->device->flags,
> value); else if (key_match("PrivateKey")) { ret =
> parse_key(ctx->device->private_key, value); if (ret)
> @@ -530,6 +717,16 @@ struct wgdevice *config_read_cmd(char *argv[],
> int argc) goto error;
>  			argv += 2;
>  			argc -= 2;
> +		} else if (!strcmp(argv[0], "handshake-dscp") &&
> argc >= 2 && !peer) {
> +			if
> (!parse_handshake_dscp(&device->handshake_dscp, &device->flags,
> argv[1]))
> +				goto error;
> +			argv += 2;
> +			argc -= 2;
> +		} else if (!strcmp(argv[0], "inherit-dscp") && argc
> >= 2 && !peer) {
> +			if
> (!parse_inherit_dscp(&device->inherit_dscp, &device->flags, argv[1]))
> +				goto error;
> +			argv += 2;
> +			argc -= 2;
>  		} else if (!strcmp(argv[0], "private-key") && argc
> >= 2 && !peer) { if (!parse_keyfile(device->private_key, argv[1]))
>  				goto error;
> diff --git a/src/tools/containers.h b/src/tools/containers.h
> index 59a213e..694a06e 100644
> --- a/src/tools/containers.h
> +++ b/src/tools/containers.h
> @@ -64,7 +64,9 @@ enum {
>  	WGDEVICE_HAS_PRIVATE_KEY = 1U << 1,
>  	WGDEVICE_HAS_PUBLIC_KEY = 1U << 2,
>  	WGDEVICE_HAS_LISTEN_PORT = 1U << 3,
> -	WGDEVICE_HAS_FWMARK = 1U << 4
> +	WGDEVICE_HAS_FWMARK = 1U << 4,
> +	WGDEVICE_HAS_HANDSHAKE_DSCP = 1U << 5,
> +	WGDEVICE_HAS_INHERIT_DSCP = 1U << 6
>  };
>  
>  struct wgdevice {
> @@ -78,6 +80,8 @@ struct wgdevice {
>  
>  	uint32_t fwmark;
>  	uint16_t listen_port;
> +	uint8_t handshake_dscp;
> +	uint8_t inherit_dscp;
>  
>  	struct wgpeer *first_peer, *last_peer;
>  };
> diff --git a/src/tools/ipc.c b/src/tools/ipc.c
> index 7ab3a62..1baf138 100644
> --- a/src/tools/ipc.c
> +++ b/src/tools/ipc.c
> @@ -220,6 +220,10 @@ static int userspace_set_device(struct wgdevice
> *dev) fprintf(f, "listen_port=%u\n", dev->listen_port);
>  	if (dev->flags & WGDEVICE_HAS_FWMARK)
>  		fprintf(f, "fwmark=%u\n", dev->fwmark);
> +	if (dev->flags & WGDEVICE_HAS_HANDSHAKE_DSCP)
> +		fprintf(f, "handshake_dscp=%u\n",
> dev->handshake_dscp);
> +	if (dev->flags & WGDEVICE_HAS_INHERIT_DSCP)
> +		fprintf(f, "inherit_dscp=%u\n", dev->inherit_dscp);
>  	if (dev->flags & WGDEVICE_REPLACE_PEERS)
>  		fprintf(f, "replace_peers=true\n");
>  
> @@ -331,6 +335,12 @@ static int userspace_get_device(struct wgdevice
> **out, const char *interface) } else if (!peer && !strcmp(key,
> "fwmark")) { dev->fwmark = NUM(0xffffffffU);
>  			dev->flags |= WGDEVICE_HAS_FWMARK;
> +		} else if (!peer && !strcmp(key, "handshake_dscp")) {
> +			dev->handshake_dscp = NUM(0xfcU);
> +			dev->flags |= WGDEVICE_HAS_HANDSHAKE_DSCP;
> +		} else if (!peer && !strcmp(key, "inherit_dscp")) {
> +			dev->inherit_dscp = NUM(0xffU);
> +			dev->flags |= WGDEVICE_HAS_INHERIT_DSCP;
>  		} else if (!strcmp(key, "public_key")) {
>  			struct wgpeer *new_peer = calloc(1,
> sizeof(*new_peer)); 
> @@ -577,6 +587,10 @@ again:
>  			mnl_attr_put_u16(nlh,
> WGDEVICE_A_LISTEN_PORT, dev->listen_port); if (dev->flags &
> WGDEVICE_HAS_FWMARK) mnl_attr_put_u32(nlh, WGDEVICE_A_FWMARK,
> dev->fwmark);
> +		if (dev->flags & WGDEVICE_HAS_HANDSHAKE_DSCP)
> +			mnl_attr_put_u8(nlh,
> WGDEVICE_A_HANDSHAKE_DSCP, dev->handshake_dscp);
> +		if (dev->flags & WGDEVICE_HAS_INHERIT_DSCP)
> +			mnl_attr_put_u8(nlh,
> WGDEVICE_A_INHERIT_DSCP, dev->inherit_dscp); if (dev->flags &
> WGDEVICE_REPLACE_PEERS) flags |= WGDEVICE_F_REPLACE_PEERS;
>  		if (flags)
> @@ -851,6 +865,14 @@ static int parse_device(const struct nlattr
> *attr, void *data) if (!mnl_attr_validate(attr, MNL_TYPE_U32))
>  			device->fwmark = mnl_attr_get_u32(attr);
>  		break;
> +	case WGDEVICE_A_HANDSHAKE_DSCP:
> +		if (!mnl_attr_validate(attr, MNL_TYPE_U8))
> +			device->handshake_dscp =
> mnl_attr_get_u8(attr);
> +		break;
> +	case WGDEVICE_A_INHERIT_DSCP:
> +		if (!mnl_attr_validate(attr, MNL_TYPE_U8))
> +			device->inherit_dscp = mnl_attr_get_u8(attr);
> +		break;
>  	case WGDEVICE_A_PEERS:
>  		return mnl_attr_parse_nested(attr, parse_peers,
> device); }
> diff --git a/src/tools/man/wg.8 b/src/tools/man/wg.8
> index 2013825..8251ac8 100644
> --- a/src/tools/man/wg.8
> +++ b/src/tools/man/wg.8
> @@ -33,10 +33,13 @@ If no COMMAND is specified, COMMAND defaults to
>  .BR show .
>  Sub-commands that take an INTERFACE must be passed a WireGuard
> interface. 
> +.SH PRIVACY
> +WireGuard provide confidentiality of data that it transports. It
> does not hide connection endpoints, sequences of packet sizes, or
> inter-packet timings.  It will also expose DSCP markings if
> configured to do so.  Be mindful that this information may be used to
> gain some insight into your communications. You should consider your
> circumstances and if necessary combine WireGuard with other tools
> such as TOR. + .SH COMMANDS .TP -\fBshow\fP { \fI<interface>\fP |
> \fIall\fP | \fIinterfaces\fP } [\fIpublic-key\fP | \fIprivate-key\fP
> | \fIlisten-port\fP | \fIfwmark\fP | \fIpeers\fP |
> \fIpreshared-keys\fP | \fIendpoints\fP | \fIallowed-ips\fP |
> \fIlatest-handshakes\fP | \fIpersistent-keepalive\fP | \fItransfer\fP
> | \fIdump\fP] +\fBshow\fP { \fI<interface>\fP | \fIall\fP |
> \fIinterfaces\fP } [\fIpublic-key\fP | \fIprivate-key\fP |
> \fIlisten-port\fP | \fIfwmark\fP | \fIhandshake-dscp\fP |
> \fIinherit-dscp\fP | \fIpeers\fP | \fIpreshared-keys\fP |
> \fIendpoints\fP | \fIallowed-ips\fP | \fIlatest-handshakes\fP |
> \fIpersistent-keepalive\fP | \fItransfer\fP | \fIdump\fP] Shows
> current WireGuard configuration and runtime information of specified
> \fI<interface>\fP. If no \fI<interface>\fP is specified,
> \fI<interface>\fP defaults to \fIall\fP. If \fIinterfaces\fP is
> specified, prints a list of all WireGuard interfaces, @@ -47,7 +50,7
> @@ newlines and tabs, meant to be used in scripts. For this
> script-friendly display if \fIall\fP is specified, then the first
> field for all categories of information is the interface name. If
> \fPdump\fP is specified, then several lines are printed; the first
> contains in order separated by tab: private-key, public-key,
> listen-port, -fwmark. Subsequent lines are printed for each peer and
> contain in order separated +fwmark, handshake-dscp, inherit-dscp.
> Subsequent lines are printed for each peer and contain in order
> separated by tab: public-key, preshared-key, endpoint, allowed-ips,
> latest-handshake, transfer-rx, transfer-tx, persistent-keepalive. .TP
> @@ -55,7 +58,7 @@ transfer-rx, transfer-tx, persistent-keepalive.
> Shows the current configuration of \fI<interface>\fP in the format
> described by \fICONFIGURATION FILE FORMAT\fP below. .TP -\fBset\fP
> \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\fP
> \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP
> \fI<base64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP
> \fI<file-path>\fP] [\fIendpoint\fP \fI<ip>:<port>\fP]
> [\fIpersistent-keepalive\fP \fI<interval seconds>\fP]
> [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
> +\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP]
> [\fIfwmark\fP \fI<fwmark>\fP] [\fIhandshake-dscp\fP \fI<dscp>\fP]
> [\fIinherit-dscp\fP \fI<inherit>\fP] [\fIprivate-key\fP
> \fI<file-path>\fP] [\fIpeer\fP \fI<base64-public-key>\fP
> [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP]
> [\fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP
> \fI<interval seconds>\fP] [\fIallowed-ips\fP
> \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]... Sets configuration
> values for the specified \fI<interface>\fP. Multiple \fIpeer\fPs may
> be specified, and if the \fIremove\fP argument is given for a peer,
> that peer is removed, not configured. If \fIlisten-port\fP @@ -82,7
> +85,13 @@ from a peer, and it is behind NAT, the interface might
> benefit from having a persistent keepalive interval of 25 seconds;
> however, most users will not need this. The use of \fIfwmark\fP is
> optional and is by default off; setting it to 0 or "off" disables it.
> Otherwise it is a 32-bit fwmark for outgoing packets -and may be
> specified in hexadecimal by prepending "0x". +and may be specified in
> hexadecimal by prepending "0x". Handshake DSCP sets the +DSCP value
> used for handshake packets.  By default, AF41 ( 0x88 ) is used.
> Values +may be specified as decimal, hex or DSCP name CS6, EF, CS5,
> AF41, AF42, AF43, CS4, +AF31, AF32, AF33, CS3, AF21, AF22, AF23, C24,
> AF11, AF12, AF13, CS0, DF, CS1. When +specified numerically the dscp
> value occupies the top 6 bits in a byte.  Inherit DSCP, +when set to
> a non-zero value or 'on' will copy the inner DSCP value to the
> encapsulating +packet.  By default inherit-dscp is off and zero is
> used for the encapsulating DSCP value. .TP \fBsetconf\fP
> \fI<interface>\fP \fI<configuration-filename>\fP Sets the current
> configuration of \fI<interface>\fP to the contents of @@ -131,6
> +140,8 @@ randomly. .IP \(bu FwMark \(em a 32-bit fwmark for outgoing
> packets. If set to 0 or "off", this option is disabled. May be
> specified in hexadecimal by prepending "0x". Optional. +.IP \(bu
> +HandshakeDSCP \(em a 8-bit DSCP marking for outgoing packets. .P The
> \fIPeer\fP sections may contain the following fields: .IP \(bu diff
> --git a/src/tools/set.c b/src/tools/set.c index 19f4b92..7c3a3a4
> 100644 --- a/src/tools/set.c +++ b/src/tools/set.c @@ -18,7 +18,7 @@
> int set_main(int argc, char *argv[]) int ret = 1; if (argc < 3) {
> -		fprintf(stderr, "Usage: %s %s <interface>
> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer
> <base64 public key> [remove] [preshared-key <file path>] [endpoint
> <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips
> <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
> +		fprintf(stderr, "Usage: %s %s <interface>
> [listen-port <port>] [fwmark <mark>] [handshake-dscp <dscp>]
> [inherit-dscp <inherit>] [private-key <file path>] [peer <base64
> public key> [remove] [preshared-key <file path>] [endpoint
> <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips
> <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
> return 1; } diff --git a/src/tools/show.c b/src/tools/show.c index
> 4cc34ab..9367b97 100644 --- a/src/tools/show.c +++ b/src/tools/show.c
> @@ -203,7 +203,7 @@ static char *bytes(uint64_t b)
>  static const char *COMMAND_NAME;
>  static void show_usage(void)
>  {
> -	fprintf(stderr, "Usage: %s %s { <interface> | all |
> interfaces } [public-key | private-key | listen-port | fwmark | peers
> | preshared-keys | endpoints | allowed-ips | latest-handshakes |
> transfer | persistent-keepalive | dump]\n", PROG_NAME, COMMAND_NAME);
> +	fprintf(stderr, "Usage: %s %s { <interface> | all |
> interfaces } [public-key | private-key | listen-port | fwmark |
> handshake-dscp | inherit-dscp | peers | preshared-keys | endpoints |
> allowed-ips | latest-handshakes | transfer | persistent-keepalive |
> dump]\n", PROG_NAME, COMMAND_NAME); } static void pretty_print(struct
> wgdevice *device) @@ -221,6 +221,10 @@ static void
> pretty_print(struct wgdevice *device) terminal_printf("  "
> TERMINAL_BOLD "listening port" TERMINAL_RESET ": %u\n",
> device->listen_port); if (device->fwmark) terminal_printf("  "
> TERMINAL_BOLD "fwmark" TERMINAL_RESET ": 0x%x\n", device->fwmark);
> +	if (device->handshake_dscp != 0x88)
> +		terminal_printf("  " TERMINAL_BOLD "handshake_dscp"
> TERMINAL_RESET ": 0x%x\n", device->handshake_dscp);
> +	if (device->inherit_dscp)
> +		terminal_printf("  " TERMINAL_BOLD "inherit_dscp"
> TERMINAL_RESET ": 1\n"); if (device->first_peer) {
>  		sort_peers(device);
>  		terminal_printf("\n");
> @@ -265,6 +269,8 @@ static void dump_print(struct wgdevice *device,
> bool with_interface) printf("0x%x\n", device->fwmark);
>  	else
>  		printf("off\n");
> +	printf("%u\t", device->handshake_dscp);
> +	printf("%u\t", device->inherit_dscp);
>  	for_each_wgpeer(device, peer) {
>  		if (with_interface)
>  			printf("%s\t", device->name);
> @@ -312,6 +318,14 @@ static bool ugly_print(struct wgdevice *device,
> const char *param, bool with_int printf("0x%x\n", device->fwmark);
>  		else
>  			printf("off\n");
> +	} else if (!strcmp(param, "handshake-dscp")) {
> +		if (with_interface)
> +			printf("%s\t", device->name);
> +		printf("0x%x\n", device->handshake_dscp);
> +	} else if (!strcmp(param, "inherit-dscp")) {
> +		if (with_interface)
> +			printf("%s\t", device->name);
> +		printf("%u\n", device->inherit_dscp);
>  	} else if (!strcmp(param, "endpoints")) {
>  		if (with_interface)
>  			printf("%s\t", device->name);
> diff --git a/src/tools/showconf.c b/src/tools/showconf.c
> index ad76b7f..415228f 100644
> --- a/src/tools/showconf.c
> +++ b/src/tools/showconf.c
> @@ -42,6 +42,10 @@ int showconf_main(int argc, char *argv[])
>  		printf("ListenPort = %u\n", device->listen_port);
>  	if (device->fwmark)
>  		printf("FwMark = 0x%x\n", device->fwmark);
> +	if (device->handshake_dscp != 0x88)
> +		printf("HandshakeDSCP = 0x%x\n",
> device->handshake_dscp);
> +	if (device->inherit_dscp)
> +		printf("InheritDSCP = %u\n", device->inherit_dscp);
>  	if (device->flags & WGDEVICE_HAS_PRIVATE_KEY) {
>  		key_to_base64(base64, device->private_key);
>  		printf("PrivateKey = %s\n", base64);
> diff --git a/src/uapi/wireguard.h b/src/uapi/wireguard.h
> index 071ce41..60ef8cc 100644
> --- a/src/uapi/wireguard.h
> +++ b/src/uapi/wireguard.h
> @@ -29,6 +29,8 @@
>   *    WGDEVICE_A_PUBLIC_KEY: len WG_KEY_LEN
>   *    WGDEVICE_A_LISTEN_PORT: NLA_U16
>   *    WGDEVICE_A_FWMARK: NLA_U32
> + *    WGDEVICE_A_HANDSHAKE_DSCP: NLA_U8
> + *    WGDEVICE_A_INHERIT_DSCP: NLA_U8
>   *    WGDEVICE_A_PEERS: NLA_NESTED
>   *        0: NLA_NESTED
>   *            WGPEER_A_PUBLIC_KEY: len WG_KEY_LEN
> @@ -83,6 +85,8 @@
>   *    WGDEVICE_A_PRIVATE_KEY: len WG_KEY_LEN, all zeros to remove
>   *    WGDEVICE_A_LISTEN_PORT: NLA_U16, 0 to choose randomly
>   *    WGDEVICE_A_FWMARK: NLA_U32, 0 to disable
> + *    WGDEVICE_A_HANDSHAKE_DSCP: NLA_U8, 8 bit value, bottom two
> bits will be zeroed
> + *    WGDEVICE_A_INHERIT_DSCP: NLA_U8, non-zero value, inherit dscp
> from inner packet
>   *    WGDEVICE_A_PEERS: NLA_NESTED
>   *        0: NLA_NESTED
>   *            WGPEER_A_PUBLIC_KEY: len WG_KEY_LEN
> @@ -154,6 +158,8 @@ enum wgdevice_attribute {
>  	WGDEVICE_A_LISTEN_PORT,
>  	WGDEVICE_A_FWMARK,
>  	WGDEVICE_A_PEERS,
> +	WGDEVICE_A_HANDSHAKE_DSCP,
> +	WGDEVICE_A_INHERIT_DSCP,
>  	__WGDEVICE_A_LAST
>  };
>  #define WGDEVICE_A_MAX (__WGDEVICE_A_LAST - 1)

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
