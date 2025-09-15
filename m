Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8ABCF2598
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 08:15:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12edeb15;
	Tue, 18 Nov 2025 17:30:38 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e13031eb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Sep 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757947660;
 bh=+kb1Z2x/UKU6OTxYCfMpVoKjYlmKBpw2h4XRUfikwbw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q/4oJWLmSwqkQ2ZFm/oyO2cG0AsqK1vDE8VsgfsgB3StH5QjpR5zNt7VTAJ0wzcld
 VYTHfKuCXAf8bjI6P4YRVWDci0HhGqKhLDWVdHJgJ3jmzVLKyKDFpmhlDxJEtVD0sH
 DJbn5V5Q9a5tRnwDyQ27blxyurW4aLY1DHnRbF5aWjQyrdEFxvE+6AOxwnhzatEEzO
 JtmzQaLRYqLLwFhVLtygW5swahMvxe7cl5HW6MY5zjYcn65oVGjDtOm4zCIJvvqSyC
 CWTYkoBsH1GcCILMbZVKrUUGbMeYYiLlrks2w7xpKpCE8a2rT3sVtZvOXwBcgVqNg3
 UNI8PsiuuYbXg==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 696136012E;
 Mon, 15 Sep 2025 14:47:39 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 4170D204C71; Mon, 15 Sep 2025 14:43:06 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 06/11] tools: ynl-gen: validate nested arrays
Date: Mon, 15 Sep 2025 14:42:51 +0000
Message-ID: <20250915144301.725949-7-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915144301.725949-1-ast@fiberby.net>
References: <20250915144301.725949-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

In nested arrays don't require that the intermediate attribute
type should be a valid attribute type, it might just be zero
or an incrementing index, it is often not even used.

See include/net/netlink.h about NLA_NESTED_ARRAY:
> The difference to NLA_NESTED is the structure:
> NLA_NESTED has the nested attributes directly inside
> while an array has the nested attributes at another
> level down and the attribute types directly in the
> nesting don't matter.

Example based on include/uapi/linux/wireguard.h:
 > WGDEVICE_A_PEERS: NLA_NESTED
 >   0: NLA_NESTED
 >     WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
 >     [..]
 >   0: NLA_NESTED
 >     ...
 >   ...

Previous the check required that the nested type was valid
in the parent attribute set, which in this case resolves to
WGDEVICE_A_UNSPEC, which is YNL_PT_REJECT, and it took the
early exit and returned YNL_PARSE_CB_ERROR.

This patch renames the old nl_attr_validate() to
__nl_attr_validate(), and creates a new inline function
nl_attr_validate() to mimic the old one.

The new __nl_attr_validate() takes the attribute type as an
argument, so we can use it to validate attributes of a
nested attribute, in the context of the parents attribute
type, which in the above case is generated as:
[WGDEVICE_A_PEERS] = {
  .name = "peers",
  .type = YNL_PT_NEST,
  .nest = &wireguard_wgpeer_nest,
},

__nl_attr_validate() only checks if the attribute length
is plausible for a given attribute type, so the .nest in
the above example is not used.

As the new inline function needs to be defined after
ynl_attr_type(), then the definitions are moved down,
so we avoid a forward declaration of ynl_attr_type().

Some other examples are NL80211_BAND_ATTR_FREQS (nest) and
NL80211_ATTR_SUPPORTED_COMMANDS (u32) both in nl80211-user.c
$ make -C tools/net/ynl/generated nl80211-user.c

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/lib/ynl-priv.h     | 10 +++++++++-
 tools/net/ynl/lib/ynl.c          |  6 +++---
 tools/net/ynl/pyynl/ynl_gen_c.py |  2 +-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/net/ynl/lib/ynl-priv.h b/tools/net/ynl/lib/ynl-priv.h
index 824777d7e05e..29481989ea76 100644
--- a/tools/net/ynl/lib/ynl-priv.h
+++ b/tools/net/ynl/lib/ynl-priv.h
@@ -106,7 +106,6 @@ ynl_gemsg_start_req(struct ynl_sock *ys, __u32 id, __u8 cmd, __u8 version);
 struct nlmsghdr *
 ynl_gemsg_start_dump(struct ynl_sock *ys, __u32 id, __u8 cmd, __u8 version);
 
-int ynl_attr_validate(struct ynl_parse_arg *yarg, const struct nlattr *attr);
 int ynl_submsg_failed(struct ynl_parse_arg *yarg, const char *field_name,
 		      const char *sel_name);
 
@@ -467,4 +466,13 @@ ynl_attr_put_sint(struct nlmsghdr *nlh, __u16 type, __s64 data)
 	else
 		ynl_attr_put_s64(nlh, type, data);
 }
+
+int __ynl_attr_validate(struct ynl_parse_arg *yarg, const struct nlattr *attr,
+			unsigned int type);
+
+static inline int ynl_attr_validate(struct ynl_parse_arg *yarg,
+				    const struct nlattr *attr)
+{
+	return __ynl_attr_validate(yarg, attr, ynl_attr_type(attr));
+}
 #endif
diff --git a/tools/net/ynl/lib/ynl.c b/tools/net/ynl/lib/ynl.c
index 2a169c3c0797..2bcd781111d7 100644
--- a/tools/net/ynl/lib/ynl.c
+++ b/tools/net/ynl/lib/ynl.c
@@ -360,15 +360,15 @@ static int ynl_cb_done(const struct nlmsghdr *nlh, struct ynl_parse_arg *yarg)
 
 /* Attribute validation */
 
-int ynl_attr_validate(struct ynl_parse_arg *yarg, const struct nlattr *attr)
+int __ynl_attr_validate(struct ynl_parse_arg *yarg, const struct nlattr *attr,
+			unsigned int type)
 {
 	const struct ynl_policy_attr *policy;
-	unsigned int type, len;
 	unsigned char *data;
+	unsigned int len;
 
 	data = ynl_attr_data(attr);
 	len = ynl_attr_data_len(attr);
-	type = ynl_attr_type(attr);
 	if (type > yarg->rsp_policy->max_attr) {
 		yerr(yarg->ys, YNL_ERROR_INTERNAL,
 		     "Internal error, validating unknown attribute");
diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index a7c65edc863d..9b42e75d24e9 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -830,7 +830,7 @@ class TypeArrayNest(Type):
         local_vars = ['const struct nlattr *attr2;']
         get_lines = [f'attr_{self.c_name} = attr;',
                      'ynl_attr_for_each_nested(attr2, attr) {',
-                     '\tif (ynl_attr_validate(yarg, attr2))',
+                     '\tif (__ynl_attr_validate(yarg, attr2, type))',
                      '\t\treturn YNL_PARSE_CB_ERROR;',
                      f'\tn_{self.c_name}++;',
                      '}']
-- 
2.51.0

