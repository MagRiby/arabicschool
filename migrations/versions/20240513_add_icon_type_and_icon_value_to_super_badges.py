"""
Add icon_type and icon_value columns to super_badges
"""
from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision = '20240513_add_icon_type_and_icon_value_to_super_badges'
down_revision = None
branch_labels = None
depends_on = None

def upgrade():
    op.add_column('super_badges', sa.Column('icon_type', sa.String(length=20), nullable=True))
    op.add_column('super_badges', sa.Column('icon_value', sa.Text(), nullable=True))

def downgrade():
    op.drop_column('super_badges', 'icon_type')
    op.drop_column('super_badges', 'icon_value')
