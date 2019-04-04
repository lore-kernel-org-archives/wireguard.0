Return-Path: <SRS0=W+hy=SG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D784FC4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Apr 2019 19:20:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376C52075E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Apr 2019 19:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376C52075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 135ea69e;
	Thu, 4 Apr 2019 19:18:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b36a8773
 for <wireguard@lists.zx2c4.com>; Thu, 4 Apr 2019 19:18:38 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97e97c2f
 for <wireguard@lists.zx2c4.com>; Thu, 4 Apr 2019 19:18:38 +0000 (UTC)
Received: from [192.168.123.161] (1piece.static.monkeybrains.net
 [::ffff:208.90.213.83]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 00000000000489FC.000000005CA65A2D.0000499C; Thu, 04 Apr 2019 12:25:33 -0700
Subject: Re: [PATCH 1/2] peer: add wg_peer_reset_keys
To: Triffid Hunter <triffid.hunter@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20190313224643.17904-1-derrick@pallas.us>
 <CACL3eKB7SLDoAbWc9+k5s4SE4jDKRu_FYSpUx0Co_83=cdfqog@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <a4e97b52-6058-023f-2eba-0de4234ab497@pallas.us>
Date: Thu, 4 Apr 2019 12:20:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACL3eKB7SLDoAbWc9+k5s4SE4jDKRu_FYSpUx0Co_83=cdfqog@mail.gmail.com>
Content-Language: en-US
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2473570167874652498=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============2473570167874652498==
Content-Type: multipart/alternative;
 boundary="------------17499F4A6AFD27EB49EE67F9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------17499F4A6AFD27EB49EE67F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Triffid, have you had a chance to test?

Jason, did you have any more thoughts? (You've clearly been busy given 
all the recent announcements!) This is the second version, which 
required a rebase but the code remained the same after verifying that 
the process did not change at all.

Thanks, ~Derrick


On 3/13/19 11:47 PM, Triffid Hunter wrote:
> This sounds interesting, as I often get long (10-30 minute) stalls 
> where wg is doing nothing but throwing keys back and forth. I'll let 
> you know if it helps when I have a chance to test properly.
>
> On Thu, 14 Mar 2019 at 06:44, <derrick@pallas.us 
> <mailto:derrick@pallas.us>> wrote:
>
>     From: Derrick Pallas <derrick@pallas.us <mailto:derrick@pallas.us>>
>
>     This function will clear the key state for the peer and reset its
>     handshake
>     timer.  This is useful, for instance, if it is known that the
>     current key
>     material is bad.  Currently, this happens when the private key is
>     changed.
>
>     Signed-off-by: Derrick Pallas <derrick@pallas.us
>     <mailto:derrick@pallas.us>>
>     ---
>      src/peer.c | 14 ++++++++++++++
>      src/peer.h |  1 +
>      2 files changed, 15 insertions(+)
>
>     diff --git a/src/peer.c b/src/peer.c
>     index 996f40b..be244a4 100644
>     --- a/src/peer.c
>     +++ b/src/peer.c
>     @@ -160,6 +160,20 @@ static void peer_remove_after_dead(struct
>     wg_peer *peer)
>             wg_peer_put(peer);
>      }
>
>     +void wg_peer_reset_keys(struct wg_peer *peer)
>     +{
>     +       if (unlikely(!peer))
>     +               return;
>     +  lockdep_assert_held(&peer->device->device_update_lock);
>     +
>     +       wg_noise_handshake_clear(&peer->handshake);
>     +       wg_noise_keypairs_clear(&peer->keypairs);
>     +       wg_cookie_checker_precompute_peer_keys(peer);
>     +       atomic64_set(&peer->last_sent_handshake,
>     +               ktime_get_boot_fast_ns() -
>     +                       (u64)(REKEY_TIMEOUT + 1) * NSEC_PER_SEC);
>     +}
>     +
>      /* We have a separate "remove" function make sure that all active
>     places where
>       * a peer is currently operating will eventually come to an end
>     and not pass
>       * their reference onto another context.
>     diff --git a/src/peer.h b/src/peer.h
>     index 23af409..f85817f 100644
>     --- a/src/peer.h
>     +++ b/src/peer.h
>     @@ -79,5 +79,6 @@ static inline struct wg_peer *wg_peer_get(struct
>     wg_peer *peer)
>      void wg_peer_put(struct wg_peer *peer);
>      void wg_peer_remove(struct wg_peer *peer);
>      void wg_peer_remove_all(struct wg_device *wg);
>     +void wg_peer_reset_keys(struct wg_peer *peer);
>
>      #endif /* _WG_PEER_H */
>     -- 
>     2.19.2
>
>     _______________________________________________
>     WireGuard mailing list
>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--------------17499F4A6AFD27EB49EE67F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Triffid, have you had a chance to test?</p>
    <p>Jason, did you have any more thoughts? (You've clearly been busy
      given all the recent announcements!) This is the second version,
      which required a rebase but the code remained the same after
      verifying that the process did not change at all.<br>
    </p>
    <p>Thanks, ~Derrick<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/13/19 11:47 PM, Triffid Hunter
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACL3eKB7SLDoAbWc9+k5s4SE4jDKRu_FYSpUx0Co_83=cdfqog@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">This sounds interesting, as I often get long (10-30
        minute) stalls where wg is doing nothing but throwing keys back
        and forth. I'll let you know if it helps when I have a chance to
        test properly.<br>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, 14 Mar 2019 at 06:44,
          &lt;<a href="mailto:derrick@pallas.us" moz-do-not-send="true">derrick@pallas.us</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Derrick Pallas &lt;<a href="mailto:derrick@pallas.us"
            target="_blank" moz-do-not-send="true">derrick@pallas.us</a>&gt;<br>
          <br>
          This function will clear the key state for the peer and reset
          its handshake<br>
          timer.  This is useful, for instance, if it is known that the
          current key<br>
          material is bad.  Currently, this happens when the private key
          is changed.<br>
          <br>
          Signed-off-by: Derrick Pallas &lt;<a
            href="mailto:derrick@pallas.us" target="_blank"
            moz-do-not-send="true">derrick@pallas.us</a>&gt;<br>
          ---<br>
           src/peer.c | 14 ++++++++++++++<br>
           src/peer.h |  1 +<br>
           2 files changed, 15 insertions(+)<br>
          <br>
          diff --git a/src/peer.c b/src/peer.c<br>
          index 996f40b..be244a4 100644<br>
          --- a/src/peer.c<br>
          +++ b/src/peer.c<br>
          @@ -160,6 +160,20 @@ static void peer_remove_after_dead(struct
          wg_peer *peer)<br>
                  wg_peer_put(peer);<br>
           }<br>
          <br>
          +void wg_peer_reset_keys(struct wg_peer *peer)<br>
          +{<br>
          +       if (unlikely(!peer))<br>
          +               return;<br>
          +     
           lockdep_assert_held(&amp;peer-&gt;device-&gt;device_update_lock);<br>
          +<br>
          +       wg_noise_handshake_clear(&amp;peer-&gt;handshake);<br>
          +       wg_noise_keypairs_clear(&amp;peer-&gt;keypairs);<br>
          +       wg_cookie_checker_precompute_peer_keys(peer);<br>
          +       atomic64_set(&amp;peer-&gt;last_sent_handshake,<br>
          +               ktime_get_boot_fast_ns() -<br>
          +                       (u64)(REKEY_TIMEOUT + 1) *
          NSEC_PER_SEC);<br>
          +}<br>
          +<br>
           /* We have a separate "remove" function make sure that all
          active places where<br>
            * a peer is currently operating will eventually come to an
          end and not pass<br>
            * their reference onto another context.<br>
          diff --git a/src/peer.h b/src/peer.h<br>
          index 23af409..f85817f 100644<br>
          --- a/src/peer.h<br>
          +++ b/src/peer.h<br>
          @@ -79,5 +79,6 @@ static inline struct wg_peer
          *wg_peer_get(struct wg_peer *peer)<br>
           void wg_peer_put(struct wg_peer *peer);<br>
           void wg_peer_remove(struct wg_peer *peer);<br>
           void wg_peer_remove_all(struct wg_device *wg);<br>
          +void wg_peer_reset_keys(struct wg_peer *peer);<br>
          <br>
           #endif /* _WG_PEER_H */<br>
          -- <br>
          2.19.2<br>
          <br>
          _______________________________________________<br>
          WireGuard mailing list<br>
          <a href="mailto:WireGuard@lists.zx2c4.com" target="_blank"
            moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
          <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------17499F4A6AFD27EB49EE67F9--

--===============2473570167874652498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2473570167874652498==--
